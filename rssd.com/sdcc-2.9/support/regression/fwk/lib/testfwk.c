/** Test framework support functions.
 */
#include <testfwk.h>
#ifndef NO_VARARGS
#include <stdarg.h>
#endif

#ifdef SDCC_ds390
#include <tinibios.h> /* main() must see the ISR declarations */
#endif

#ifdef SDCC_mcs51
/* until changed, isr's must have a prototype in the module containing main */
void T2_isr (void) interrupt 5;
#define MEMSPACE_BUF idata
#else
#define MEMSPACE_BUF
#endif

/** Define this if the port's div or mod functions are broken.
    A slow loop based method will be substituded.
*/
//#define BROKEN_DIV_MOD		1

extern void _putchar(char c);
extern void _initEmu(void);
extern void _exitEmu(void);

int __numTests = 0;
static int __numFailures = 0;

#if BROKEN_DIV_MOD
static int
__div(int num, int denom)
{
    int q = 0;
    while (num >= denom) {
        q++;
        num -= denom;
    }
    return q;
}

static int
__mod(int num, int denom)
{
    while (num >= denom) {
        num -= denom;
    }
    return num;
}
#else
#define __div(num, denom) ((num) / (denom))
#define __mod(num, denom) ((num) % (denom))
#endif

void
__prints(const char *s)
{
  char c;

  while ('\0' != (c = *s)) {
    _putchar(c);
    ++s;
  }
}

void
__printn(int n)
{
  if (0 == n) {
    _putchar('0');
  }
  else {
    static char MEMSPACE_BUF buf[6];
    char MEMSPACE_BUF *p = &buf[sizeof(buf) - 1];
    char neg = 0;

    buf[sizeof(buf) - 1] = '\0';

    if (0 > n) {
      n = -n;
      neg = 1;
    }
  
    while (0 != n) {
      *--p = '0' + __mod(n, 10);
      n = __div(n, 10);
    }

    if (neg)
      _putchar('-');

    __prints(p);
  }
}

#ifndef NO_VARARGS
void
__printf(const char *szFormat, ...)
{
  va_list ap;
  va_start(ap, szFormat);

  while (*szFormat) {
    if (*szFormat == '%') {
      switch (*++szFormat) {
      case 's': {
        char *sz = va_arg(ap, char *);
        __prints(sz);
        break;
      }
      case 'u': {
        int i = va_arg(ap, int);
        __printn(i);
        break;
      }
      case '%':
        _putchar('%');
        break;
      default:
        break;
      }
    }
    else {
      _putchar(*szFormat);
    }
    szFormat++;
  }
  va_end(ap);
}

void
__fail(code const char *szMsg, code const char *szCond, code const char *szFile, int line)
{
  __printf("--- FAIL: \"%s\" on %s at %s:%u\n", szMsg, szCond, szFile, line);
  __numFailures++;
}

int
main(void)
{
  _initEmu();

  __printf("--- Running: %s\n", __getSuiteName());

  __runSuite();

  __printf("--- Summary: %u/%u/%u: %u failed of %u tests in %u cases.\n",
     __numFailures, __numTests, __numCases,
     __numFailures, __numTests, __numCases
     );

  _exitEmu();

  return 0;
}
#else
void
__fail(code const char *szMsg, code const char *szCond, code const char *szFile, int line)
{
  __prints("--- FAIL: \"");
  __prints(szMsg);
  __prints("\" on ");
  __prints(szCond);
  __prints(" at ");
  __prints(szFile);
  _putchar(':');
  __printn(line);
  _putchar('\n');

  __numFailures++;
}

int
main(void)
{
  _initEmu();

  __prints("--- Running: ");
  __prints(__getSuiteName());
  _putchar('\n');

  __runSuite();

  __prints("--- Summary: ");
  __printn(__numFailures);
  _putchar('/');
  __printn(__numTests);
  _putchar('/');
  __printn(__numCases);
  __prints(": ");
  __printn(__numFailures);
  __prints(" failed of ");
  __printn(__numTests);
  __prints(" tests in ");
  __printn(__numCases);
  __prints(" cases.\n");

  _exitEmu();

  return 0;
}
#endif
