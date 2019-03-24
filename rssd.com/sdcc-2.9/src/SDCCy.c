/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.3"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Using locations.  */
#define YYLSP_NEEDED 0



/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     IDENTIFIER = 258,
     TYPE_NAME = 259,
     CONSTANT = 260,
     STRING_LITERAL = 261,
     SIZEOF = 262,
     TYPEOF = 263,
     PTR_OP = 264,
     INC_OP = 265,
     DEC_OP = 266,
     LEFT_OP = 267,
     RIGHT_OP = 268,
     LE_OP = 269,
     GE_OP = 270,
     EQ_OP = 271,
     NE_OP = 272,
     AND_OP = 273,
     OR_OP = 274,
     MUL_ASSIGN = 275,
     DIV_ASSIGN = 276,
     MOD_ASSIGN = 277,
     ADD_ASSIGN = 278,
     SUB_ASSIGN = 279,
     LEFT_ASSIGN = 280,
     RIGHT_ASSIGN = 281,
     AND_ASSIGN = 282,
     XOR_ASSIGN = 283,
     OR_ASSIGN = 284,
     TYPEDEF = 285,
     EXTERN = 286,
     STATIC = 287,
     AUTO = 288,
     REGISTER = 289,
     CODE = 290,
     EEPROM = 291,
     INTERRUPT = 292,
     SFR = 293,
     SFR16 = 294,
     SFR32 = 295,
     AT = 296,
     SBIT = 297,
     REENTRANT = 298,
     USING = 299,
     XDATA = 300,
     DATA = 301,
     IDATA = 302,
     PDATA = 303,
     VAR_ARGS = 304,
     CRITICAL = 305,
     NONBANKED = 306,
     BANKED = 307,
     SHADOWREGS = 308,
     WPARAM = 309,
     CHAR = 310,
     SHORT = 311,
     INT = 312,
     LONG = 313,
     SIGNED = 314,
     UNSIGNED = 315,
     FLOAT = 316,
     DOUBLE = 317,
     FIXED16X16 = 318,
     CONST = 319,
     VOLATILE = 320,
     VOID = 321,
     BIT = 322,
     STRUCT = 323,
     UNION = 324,
     ENUM = 325,
     RANGE = 326,
     FAR = 327,
     CASE = 328,
     DEFAULT = 329,
     IF = 330,
     ELSE = 331,
     SWITCH = 332,
     WHILE = 333,
     DO = 334,
     FOR = 335,
     GOTO = 336,
     CONTINUE = 337,
     BREAK = 338,
     RETURN = 339,
     NAKED = 340,
     JAVANATIVE = 341,
     OVERLAY = 342,
     INLINEASM = 343,
     IFX = 344,
     ADDRESS_OF = 345,
     GET_VALUE_AT_ADDRESS = 346,
     SPIL = 347,
     UNSPIL = 348,
     GETHBIT = 349,
     GETABIT = 350,
     GETBYTE = 351,
     GETWORD = 352,
     BITWISEAND = 353,
     UNARYMINUS = 354,
     IPUSH = 355,
     IPOP = 356,
     PCALL = 357,
     ENDFUNCTION = 358,
     JUMPTABLE = 359,
     RRC = 360,
     RLC = 361,
     CAST = 362,
     CALL = 363,
     PARAM = 364,
     NULLOP = 365,
     BLOCK = 366,
     LABEL = 367,
     RECEIVE = 368,
     SEND = 369,
     ARRAYINIT = 370,
     DUMMY_READ_VOLATILE = 371,
     ENDCRITICAL = 372,
     SWAP = 373,
     INLINE = 374,
     RESTRICT = 375
   };
#endif
/* Tokens.  */
#define IDENTIFIER 258
#define TYPE_NAME 259
#define CONSTANT 260
#define STRING_LITERAL 261
#define SIZEOF 262
#define TYPEOF 263
#define PTR_OP 264
#define INC_OP 265
#define DEC_OP 266
#define LEFT_OP 267
#define RIGHT_OP 268
#define LE_OP 269
#define GE_OP 270
#define EQ_OP 271
#define NE_OP 272
#define AND_OP 273
#define OR_OP 274
#define MUL_ASSIGN 275
#define DIV_ASSIGN 276
#define MOD_ASSIGN 277
#define ADD_ASSIGN 278
#define SUB_ASSIGN 279
#define LEFT_ASSIGN 280
#define RIGHT_ASSIGN 281
#define AND_ASSIGN 282
#define XOR_ASSIGN 283
#define OR_ASSIGN 284
#define TYPEDEF 285
#define EXTERN 286
#define STATIC 287
#define AUTO 288
#define REGISTER 289
#define CODE 290
#define EEPROM 291
#define INTERRUPT 292
#define SFR 293
#define SFR16 294
#define SFR32 295
#define AT 296
#define SBIT 297
#define REENTRANT 298
#define USING 299
#define XDATA 300
#define DATA 301
#define IDATA 302
#define PDATA 303
#define VAR_ARGS 304
#define CRITICAL 305
#define NONBANKED 306
#define BANKED 307
#define SHADOWREGS 308
#define WPARAM 309
#define CHAR 310
#define SHORT 311
#define INT 312
#define LONG 313
#define SIGNED 314
#define UNSIGNED 315
#define FLOAT 316
#define DOUBLE 317
#define FIXED16X16 318
#define CONST 319
#define VOLATILE 320
#define VOID 321
#define BIT 322
#define STRUCT 323
#define UNION 324
#define ENUM 325
#define RANGE 326
#define FAR 327
#define CASE 328
#define DEFAULT 329
#define IF 330
#define ELSE 331
#define SWITCH 332
#define WHILE 333
#define DO 334
#define FOR 335
#define GOTO 336
#define CONTINUE 337
#define BREAK 338
#define RETURN 339
#define NAKED 340
#define JAVANATIVE 341
#define OVERLAY 342
#define INLINEASM 343
#define IFX 344
#define ADDRESS_OF 345
#define GET_VALUE_AT_ADDRESS 346
#define SPIL 347
#define UNSPIL 348
#define GETHBIT 349
#define GETABIT 350
#define GETBYTE 351
#define GETWORD 352
#define BITWISEAND 353
#define UNARYMINUS 354
#define IPUSH 355
#define IPOP 356
#define PCALL 357
#define ENDFUNCTION 358
#define JUMPTABLE 359
#define RRC 360
#define RLC 361
#define CAST 362
#define CALL 363
#define PARAM 364
#define NULLOP 365
#define BLOCK 366
#define LABEL 367
#define RECEIVE 368
#define SEND 369
#define ARRAYINIT 370
#define DUMMY_READ_VOLATILE 371
#define ENDCRITICAL 372
#define SWAP 373
#define INLINE 374
#define RESTRICT 375




/* Copy the first part of user declarations.  */
#line 24 "SDCC.y"

#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include "SDCCglobl.h"
#include "SDCCsymt.h"
#include "SDCChasht.h"
#include "SDCCval.h"
#include "SDCCmem.h"
#include "SDCCast.h"
#include "port.h"
#include "newalloc.h"
#include "SDCCerr.h"
#include "SDCCutil.h"

extern int yyerror (char *);
extern FILE     *yyin;
int NestLevel = 0 ;     /* current NestLevel       */
int stackPtr  = 1 ;     /* stack pointer           */
int xstackPtr = 0 ;     /* xstack pointer          */
int reentrant = 0 ;
int blockNo   = 0 ;     /* sequential block number  */
int currBlockno=0 ;
int inCritical= 0 ;
int seqPointNo= 1 ;     /* sequence point number */
int ignoreTypedefType=0;
extern int yylex();
int yyparse(void);
extern int noLineno ;
char lbuff[1024];      /* local buffer */

/* break & continue stacks */
STACK_DCL(continueStack  ,symbol *,MAX_NEST_LEVEL)
STACK_DCL(breakStack  ,symbol *,MAX_NEST_LEVEL)
STACK_DCL(forStack  ,symbol *,MAX_NEST_LEVEL)
STACK_DCL(swStk   ,ast   *,MAX_NEST_LEVEL)
STACK_DCL(blockNum,int,MAX_NEST_LEVEL*3)

value *cenum = NULL  ;  /* current enumeration  type chain*/
bool uselessDecl = TRUE;

#define YYDEBUG 1



/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif

#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 70 "SDCC.y"
{
    symbol     *sym ;      /* symbol table pointer       */
    structdef  *sdef;      /* structure definition       */
    char       yychar[SDCC_NAME_MAX+1];
    sym_link   *lnk ;      /* declarator  or specifier   */
    int        yyint;      /* integer value returned     */
    value      *val ;      /* for integer constant       */
    initList   *ilist;     /* initial list               */
    const char *yyinline;  /* inlined assembler code     */
    ast        *asts;      /* expression tree            */
}
/* Line 187 of yacc.c.  */
#line 393 "SDCCy.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 406 "SDCCy.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int i)
#else
static int
YYID (i)
    int i;
#endif
{
  return i;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined _STDLIB_H \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss;
  YYSTYPE yyvs;
  };

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack)					\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack, Stack, yysize);				\
	Stack = &yyptr->Stack;						\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  67
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   1646

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  145
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  103
/* YYNRULES -- Number of rules.  */
#define YYNRULES  282
/* YYNRULES -- Number of states.  */
#define YYNSTATES  420

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   375

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   132,     2,     2,     2,   134,   127,     2,
     121,   122,   128,   129,   126,   130,   125,   133,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   140,   142,
     135,   141,   136,   139,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   123,     2,   124,   137,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   143,   138,   144,   131,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      95,    96,    97,    98,    99,   100,   101,   102,   103,   104,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   114,
     115,   116,   117,   118,   119,   120
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     4,     6,     8,    11,    13,    15,    18,
      22,    24,    27,    30,    32,    34,    36,    38,    40,    42,
      44,    46,    48,    50,    52,    55,    57,    59,    61,    65,
      67,    69,    74,    78,    83,    84,    89,    90,    95,    98,
     101,   103,   107,   109,   112,   115,   118,   121,   126,   129,
     131,   133,   135,   137,   139,   141,   143,   148,   150,   154,
     158,   162,   164,   168,   172,   174,   178,   182,   184,   188,
     192,   196,   200,   202,   206,   210,   212,   216,   218,   222,
     224,   228,   230,   231,   236,   238,   239,   244,   246,   247,
     254,   256,   260,   262,   264,   266,   268,   270,   272,   274,
     276,   278,   280,   282,   284,   285,   290,   292,   295,   299,
     301,   304,   306,   309,   311,   314,   316,   320,   322,   326,
     328,   330,   332,   334,   336,   338,   340,   343,   345,   349,
     351,   353,   355,   357,   359,   361,   363,   365,   367,   369,
     371,   373,   375,   377,   379,   381,   383,   385,   387,   389,
     391,   393,   395,   397,   399,   401,   404,   406,   408,   409,
     416,   419,   421,   423,   425,   426,   428,   430,   433,   437,
     439,   443,   445,   448,   452,   453,   458,   464,   467,   469,
     472,   476,   479,   482,   483,   485,   488,   490,   492,   494,
     497,   499,   502,   504,   508,   512,   517,   521,   522,   528,
     533,   535,   538,   541,   545,   547,   549,   552,   554,   558,
     560,   564,   566,   570,   573,   575,   577,   580,   582,   584,
     587,   591,   594,   598,   602,   607,   610,   614,   618,   619,
     625,   627,   631,   636,   638,   642,   644,   646,   648,   650,
     652,   654,   656,   659,   661,   664,   667,   671,   672,   676,
     678,   680,   683,   687,   691,   696,   699,   701,   704,   706,
     709,   711,   714,   717,   718,   719,   727,   728,   735,   737,
     739,   741,   742,   749,   757,   767,   768,   770,   774,   777,
     780,   783,   787
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     146,     0,    -1,    -1,   147,    -1,   148,    -1,   147,   148,
      -1,   149,    -1,   181,    -1,   207,   152,    -1,   182,   207,
     152,    -1,   151,    -1,   151,   150,    -1,    44,   180,    -1,
      43,    -1,    50,    -1,    85,    -1,    86,    -1,    87,    -1,
      51,    -1,    53,    -1,    54,    -1,    52,    -1,   187,    -1,
     232,    -1,   233,   232,    -1,   247,    -1,     5,    -1,   154,
      -1,   121,   178,   122,    -1,     6,    -1,   153,    -1,   155,
     123,   178,   124,    -1,   155,   121,   122,    -1,   155,   121,
     158,   122,    -1,    -1,   155,   125,   156,   247,    -1,    -1,
     155,     9,   157,   247,    -1,   155,    10,    -1,   155,    11,
      -1,   176,    -1,   176,   126,   158,    -1,   155,    -1,    10,
     159,    -1,    11,   159,    -1,   160,   161,    -1,     7,   159,
      -1,     7,   121,   219,   122,    -1,     8,   159,    -1,   127,
      -1,   128,    -1,   129,    -1,   130,    -1,   131,    -1,   132,
      -1,   159,    -1,   121,   219,   122,   161,    -1,   161,    -1,
     162,   128,   161,    -1,   162,   133,   161,    -1,   162,   134,
     161,    -1,   162,    -1,   163,   129,   162,    -1,   163,   130,
     162,    -1,   163,    -1,   164,    12,   163,    -1,   164,    13,
     163,    -1,   164,    -1,   165,   135,   164,    -1,   165,   136,
     164,    -1,   165,    14,   164,    -1,   165,    15,   164,    -1,
     165,    -1,   166,    16,   165,    -1,   166,    17,   165,    -1,
     166,    -1,   167,   127,   166,    -1,   167,    -1,   168,   137,
     167,    -1,   168,    -1,   169,   138,   168,    -1,   169,    -1,
      -1,   170,    18,   171,   169,    -1,   170,    -1,    -1,   172,
      19,   173,   170,    -1,   172,    -1,    -1,   172,   139,   175,
     172,   140,   174,    -1,   174,    -1,   161,   177,   176,    -1,
     141,    -1,    20,    -1,    21,    -1,    22,    -1,    23,    -1,
      24,    -1,    25,    -1,    26,    -1,    27,    -1,    28,    -1,
      29,    -1,   176,    -1,    -1,   178,   126,   179,   176,    -1,
     174,    -1,   182,   142,    -1,   182,   183,   142,    -1,   185,
      -1,   185,   182,    -1,   188,    -1,   188,   182,    -1,   186,
      -1,   186,   182,    -1,   184,    -1,   183,   126,   184,    -1,
     205,    -1,   205,   141,   223,    -1,    30,    -1,    31,    -1,
      32,    -1,    33,    -1,    34,    -1,   119,    -1,    37,    -1,
      37,   180,    -1,   189,    -1,   189,    41,   180,    -1,    55,
      -1,    56,    -1,    57,    -1,    58,    -1,    59,    -1,    60,
      -1,    66,    -1,    64,    -1,    65,    -1,   120,    -1,    61,
      -1,    63,    -1,    45,    -1,    35,    -1,    36,    -1,    46,
      -1,    47,    -1,    48,    -1,    67,    -1,   192,    -1,   201,
      -1,     4,    -1,   190,    -1,    42,    -1,   191,    -1,    38,
      -1,    38,    52,    -1,    39,    -1,    40,    -1,    -1,   194,
     195,   193,   143,   197,   144,    -1,   194,   196,    -1,    68,
      -1,    69,    -1,   196,    -1,    -1,   247,    -1,   198,    -1,
     197,   198,    -1,   214,   199,   142,    -1,   200,    -1,   199,
     126,   200,    -1,   205,    -1,   140,   180,    -1,   205,   140,
     180,    -1,    -1,    70,   143,   202,   144,    -1,    70,   247,
     143,   202,   144,    -1,    70,   247,    -1,   203,    -1,   202,
     126,    -1,   202,   126,   203,    -1,   247,   204,    -1,   141,
     180,    -1,    -1,   206,    -1,   212,   206,    -1,   208,    -1,
     209,    -1,   208,    -1,   212,   208,    -1,   210,    -1,   210,
     150,    -1,   247,    -1,   121,   205,   122,    -1,   206,   123,
     124,    -1,   206,   123,   180,   124,    -1,   209,   121,   122,
      -1,    -1,   209,   121,   211,   216,   122,    -1,   209,   121,
     215,   122,    -1,   213,    -1,   213,   214,    -1,   213,   212,
      -1,   213,   214,   212,    -1,   128,    -1,   188,    -1,   214,
     188,    -1,   247,    -1,   215,   126,   247,    -1,   217,    -1,
     217,   126,    49,    -1,   218,    -1,   217,   126,   218,    -1,
     214,   205,    -1,   219,    -1,   214,    -1,   214,   220,    -1,
     212,    -1,   221,    -1,   212,   221,    -1,   121,   220,   122,
      -1,   123,   124,    -1,   123,   180,   124,    -1,   221,   123,
     124,    -1,   221,   123,   180,   124,    -1,   121,   122,    -1,
     121,   216,   122,    -1,   221,   121,   122,    -1,    -1,   221,
     121,   222,   216,   122,    -1,   176,    -1,   143,   224,   144,
      -1,   143,   224,   126,   144,    -1,   223,    -1,   224,   126,
     223,    -1,   228,    -1,   232,    -1,   235,    -1,   237,    -1,
     243,    -1,   246,    -1,   227,    -1,    88,   142,    -1,    50,
      -1,   226,   225,    -1,   247,   140,    -1,    73,   180,   140,
      -1,    -1,    74,   229,   140,    -1,   143,    -1,   144,    -1,
     230,   231,    -1,   230,   234,   231,    -1,   230,   233,   231,
      -1,   230,   233,   234,   231,    -1,     1,   142,    -1,   181,
      -1,   233,   181,    -1,   225,    -1,   234,   225,    -1,   142,
      -1,   178,   142,    -1,    76,   225,    -1,    -1,    -1,    75,
     121,   178,   122,   238,   225,   236,    -1,    -1,    77,   121,
     178,   122,   239,   225,    -1,    78,    -1,    79,    -1,    80,
      -1,    -1,   240,   121,   178,   122,   244,   225,    -1,   241,
     225,    78,   121,   178,   122,   142,    -1,   242,   121,   245,
     142,   245,   142,   245,   122,   225,    -1,    -1,   178,    -1,
      81,   247,   142,    -1,    82,   142,    -1,    83,   142,    -1,
      84,   142,    -1,    84,   178,   142,    -1,     3,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   137,   137,   140,   144,   145,   149,   152,   178,   183,
     194,   195,   199,   203,   206,   209,   212,   215,   218,   224,
     227,   230,   239,   248,   249,   257,   258,   259,   260,   264,
     268,   269,   270,   272,   276,   276,   284,   284,   291,   293,
     298,   299,   303,   304,   305,   306,   307,   308,   309,   313,
     314,   315,   316,   317,   318,   322,   323,   327,   328,   329,
     330,   334,   335,   336,   340,   341,   342,   346,   347,   348,
     349,   350,   354,   355,   356,   360,   361,   365,   366,   370,
     371,   375,   376,   376,   381,   382,   382,   387,   388,   388,
     396,   397,   445,   446,   447,   448,   449,   450,   451,   452,
     453,   454,   455,   459,   460,   460,   464,   468,   475,   495,
     496,   509,   510,   523,   524,   540,   541,   545,   546,   551,
     555,   559,   563,   567,   574,   581,   582,   595,   596,   606,
     611,   616,   621,   626,   631,   636,   641,   645,   649,   653,
     658,   663,   667,   671,   675,   679,   683,   687,   696,   701,
     707,   716,   720,   728,   732,   740,   751,   762,   775,   774,
     823,   842,   843,   847,   848,   855,   866,   867,   880,   908,
     909,   917,   918,   931,   947,   952,   957,   977,   991,   992,
     993,  1001,  1024,  1037,  1050,  1051,  1059,  1060,  1064,  1065,
    1073,  1074,  1106,  1107,  1108,  1117,  1149,  1150,  1150,  1176,
    1186,  1187,  1199,  1205,  1244,  1252,  1254,  1270,  1271,  1279,
    1280,  1284,  1285,  1293,  1305,  1316,  1317,  1334,  1335,  1336,
    1343,  1344,  1349,  1355,  1361,  1369,  1370,  1371,  1383,  1383,
    1407,  1408,  1409,  1413,  1414,  1418,  1419,  1420,  1421,  1422,
    1423,  1424,  1425,  1436,  1445,  1455,  1457,  1464,  1464,  1473,
    1481,  1485,  1486,  1487,  1488,  1491,  1495,  1508,  1534,  1535,
    1539,  1540,  1544,  1545,  1550,  1550,  1558,  1558,  1583,  1597,
    1612,  1631,  1631,  1640,  1650,  1678,  1679,  1683,  1688,  1701,
    1711,  1720,  1732
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "IDENTIFIER", "TYPE_NAME", "CONSTANT",
  "STRING_LITERAL", "SIZEOF", "TYPEOF", "PTR_OP", "INC_OP", "DEC_OP",
  "LEFT_OP", "RIGHT_OP", "LE_OP", "GE_OP", "EQ_OP", "NE_OP", "AND_OP",
  "OR_OP", "MUL_ASSIGN", "DIV_ASSIGN", "MOD_ASSIGN", "ADD_ASSIGN",
  "SUB_ASSIGN", "LEFT_ASSIGN", "RIGHT_ASSIGN", "AND_ASSIGN", "XOR_ASSIGN",
  "OR_ASSIGN", "TYPEDEF", "EXTERN", "STATIC", "AUTO", "REGISTER", "CODE",
  "EEPROM", "INTERRUPT", "SFR", "SFR16", "SFR32", "AT", "SBIT",
  "REENTRANT", "USING", "XDATA", "DATA", "IDATA", "PDATA", "VAR_ARGS",
  "CRITICAL", "NONBANKED", "BANKED", "SHADOWREGS", "WPARAM", "CHAR",
  "SHORT", "INT", "LONG", "SIGNED", "UNSIGNED", "FLOAT", "DOUBLE",
  "FIXED16X16", "CONST", "VOLATILE", "VOID", "BIT", "STRUCT", "UNION",
  "ENUM", "RANGE", "FAR", "CASE", "DEFAULT", "IF", "ELSE", "SWITCH",
  "WHILE", "DO", "FOR", "GOTO", "CONTINUE", "BREAK", "RETURN", "NAKED",
  "JAVANATIVE", "OVERLAY", "INLINEASM", "IFX", "ADDRESS_OF",
  "GET_VALUE_AT_ADDRESS", "SPIL", "UNSPIL", "GETHBIT", "GETABIT",
  "GETBYTE", "GETWORD", "BITWISEAND", "UNARYMINUS", "IPUSH", "IPOP",
  "PCALL", "ENDFUNCTION", "JUMPTABLE", "RRC", "RLC", "CAST", "CALL",
  "PARAM", "NULLOP", "BLOCK", "LABEL", "RECEIVE", "SEND", "ARRAYINIT",
  "DUMMY_READ_VOLATILE", "ENDCRITICAL", "SWAP", "INLINE", "RESTRICT",
  "'('", "')'", "'['", "']'", "'.'", "','", "'&'", "'*'", "'+'", "'-'",
  "'~'", "'!'", "'/'", "'%'", "'<'", "'>'", "'^'", "'|'", "'?'", "':'",
  "'='", "';'", "'{'", "'}'", "$accept", "file", "program",
  "external_definition", "function_definition", "function_attribute",
  "function_attributes", "function_body", "primary_expr", "string_literal",
  "postfix_expr", "@1", "@2", "argument_expr_list", "unary_expr",
  "unary_operator", "cast_expr", "multiplicative_expr", "additive_expr",
  "shift_expr", "relational_expr", "equality_expr", "and_expr",
  "exclusive_or_expr", "inclusive_or_expr", "logical_and_expr", "@3",
  "logical_or_expr", "@4", "conditional_expr", "@5", "assignment_expr",
  "assignment_operator", "expr", "@6", "constant_expr", "declaration",
  "declaration_specifiers", "init_declarator_list", "init_declarator",
  "storage_class_specifier", "function_specifier", "Interrupt_storage",
  "type_specifier", "type_specifier2", "sfr_reg_bit", "sfr_attributes",
  "struct_or_union_specifier", "@7", "struct_or_union", "opt_stag", "stag",
  "struct_declaration_list", "struct_declaration",
  "struct_declarator_list", "struct_declarator", "enum_specifier",
  "enumerator_list", "enumerator", "opt_assign_expr", "declarator",
  "declarator3", "function_declarator", "declarator2_function_attributes",
  "declarator2", "function_declarator2", "@8", "pointer",
  "unqualified_pointer", "type_specifier_list", "identifier_list",
  "parameter_type_list", "parameter_list", "parameter_declaration",
  "type_name", "abstract_declarator", "abstract_declarator2", "@9",
  "initializer", "initializer_list", "statement", "critical",
  "critical_statement", "labeled_statement", "@10", "start_block",
  "end_block", "compound_statement", "declaration_list", "statement_list",
  "expression_statement", "else_statement", "selection_statement", "@11",
  "@12", "while", "do", "for", "iteration_statement", "@13", "expr_opt",
  "jump_statement", "identifier", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
     305,   306,   307,   308,   309,   310,   311,   312,   313,   314,
     315,   316,   317,   318,   319,   320,   321,   322,   323,   324,
     325,   326,   327,   328,   329,   330,   331,   332,   333,   334,
     335,   336,   337,   338,   339,   340,   341,   342,   343,   344,
     345,   346,   347,   348,   349,   350,   351,   352,   353,   354,
     355,   356,   357,   358,   359,   360,   361,   362,   363,   364,
     365,   366,   367,   368,   369,   370,   371,   372,   373,   374,
     375,    40,    41,    91,    93,    46,    44,    38,    42,    43,
      45,   126,    33,    47,    37,    60,    62,    94,   124,    63,
      58,    61,    59,   123,   125
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   145,   146,   146,   147,   147,   148,   148,   149,   149,
     150,   150,   151,   151,   151,   151,   151,   151,   151,   151,
     151,   151,   151,   152,   152,   153,   153,   153,   153,   154,
     155,   155,   155,   155,   156,   155,   157,   155,   155,   155,
     158,   158,   159,   159,   159,   159,   159,   159,   159,   160,
     160,   160,   160,   160,   160,   161,   161,   162,   162,   162,
     162,   163,   163,   163,   164,   164,   164,   165,   165,   165,
     165,   165,   166,   166,   166,   167,   167,   168,   168,   169,
     169,   170,   171,   170,   172,   173,   172,   174,   175,   174,
     176,   176,   177,   177,   177,   177,   177,   177,   177,   177,
     177,   177,   177,   178,   179,   178,   180,   181,   181,   182,
     182,   182,   182,   182,   182,   183,   183,   184,   184,   185,
     185,   185,   185,   185,   186,   187,   187,   188,   188,   189,
     189,   189,   189,   189,   189,   189,   189,   189,   189,   189,
     189,   189,   189,   189,   189,   189,   189,   189,   189,   189,
     189,   189,   190,   190,   191,   191,   191,   191,   193,   192,
     192,   194,   194,   195,   195,   196,   197,   197,   198,   199,
     199,   200,   200,   200,   200,   201,   201,   201,   202,   202,
     202,   203,   204,   204,   205,   205,   206,   206,   207,   207,
     208,   208,   209,   209,   209,   209,   210,   211,   210,   210,
     212,   212,   212,   212,   213,   214,   214,   215,   215,   216,
     216,   217,   217,   218,   218,   219,   219,   220,   220,   220,
     221,   221,   221,   221,   221,   221,   221,   221,   222,   221,
     223,   223,   223,   224,   224,   225,   225,   225,   225,   225,
     225,   225,   225,   226,   227,   228,   228,   229,   228,   230,
     231,   232,   232,   232,   232,   232,   233,   233,   234,   234,
     235,   235,   236,   236,   238,   237,   239,   237,   240,   241,
     242,   244,   243,   243,   243,   245,   245,   246,   246,   246,
     246,   246,   247
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     0,     1,     1,     2,     1,     1,     2,     3,
       1,     2,     2,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     2,     1,     1,     1,     3,     1,
       1,     4,     3,     4,     0,     4,     0,     4,     2,     2,
       1,     3,     1,     2,     2,     2,     2,     4,     2,     1,
       1,     1,     1,     1,     1,     1,     4,     1,     3,     3,
       3,     1,     3,     3,     1,     3,     3,     1,     3,     3,
       3,     3,     1,     3,     3,     1,     3,     1,     3,     1,
       3,     1,     0,     4,     1,     0,     4,     1,     0,     6,
       1,     3,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     0,     4,     1,     2,     3,     1,
       2,     1,     2,     1,     2,     1,     3,     1,     3,     1,
       1,     1,     1,     1,     1,     1,     2,     1,     3,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     2,     1,     1,     0,     6,
       2,     1,     1,     1,     0,     1,     1,     2,     3,     1,
       3,     1,     2,     3,     0,     4,     5,     2,     1,     2,
       3,     2,     2,     0,     1,     2,     1,     1,     1,     2,
       1,     2,     1,     3,     3,     4,     3,     0,     5,     4,
       1,     2,     2,     3,     1,     1,     2,     1,     3,     1,
       3,     1,     3,     2,     1,     1,     2,     1,     1,     2,
       3,     2,     3,     3,     4,     2,     3,     3,     0,     5,
       1,     3,     4,     1,     3,     1,     1,     1,     1,     1,
       1,     1,     2,     1,     2,     2,     3,     0,     3,     1,
       1,     2,     3,     3,     4,     2,     1,     2,     1,     2,
       1,     2,     2,     0,     0,     7,     0,     6,     1,     1,
       1,     0,     6,     7,     9,     0,     1,     3,     2,     2,
       2,     3,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       2,   282,   150,   119,   120,   121,   122,   123,   142,   143,
     154,   156,   157,   152,   141,   144,   145,   146,   129,   130,
     131,   132,   133,   134,   139,   140,   136,   137,   135,   147,
     161,   162,     0,   124,   138,     0,   204,     0,     3,     4,
       6,     7,     0,   109,   113,   111,   127,   151,   153,   148,
     164,   149,     0,     0,   188,   187,   190,     0,   200,   192,
     155,     0,   177,     0,   184,   186,     0,     1,     5,   107,
       0,   115,   117,     0,     0,   110,   114,   112,     0,   158,
     160,   165,     0,     0,   249,     8,   256,     0,     0,    23,
       0,   197,   125,    13,     0,    14,    18,    21,    19,    20,
      15,    16,    17,   191,    10,    22,   189,   205,   202,   201,
       0,   178,   183,     0,   193,   185,     0,   108,     0,     9,
      26,    29,     0,     0,     0,     0,     0,    49,    50,    51,
      52,    53,    54,    30,    27,    42,    55,     0,    57,    61,
      64,    67,    72,    75,    77,    79,    81,    84,    87,   106,
     128,    25,     0,   194,     0,   255,   243,     0,   247,     0,
       0,   268,   269,   270,     0,     0,     0,     0,     0,   260,
     250,    57,    90,   103,     0,   258,     0,   241,   235,   251,
     236,     0,     0,   237,   238,     0,     0,     0,   239,   240,
      25,   257,    24,   196,     0,     0,   207,   126,    12,    11,
     206,   203,   179,   175,     0,   181,     0,   116,     0,   230,
     118,     0,    46,     0,    48,    43,    44,     0,   215,     0,
      36,    38,    39,     0,     0,    34,    45,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    82,    85,    88,     0,   195,     0,     0,
       0,     0,     0,   278,   279,   280,     0,   242,    93,    94,
      95,    96,    97,    98,    99,   100,   101,   102,    92,     0,
     104,   261,   244,   253,     0,   259,   252,     0,     0,   275,
     245,   215,     0,   209,   211,   214,   199,     0,   180,   182,
     176,   233,     0,     0,    28,     0,     0,   217,   216,   218,
       0,     0,    32,     0,    40,     0,     0,    58,    59,    60,
      62,    63,    65,    66,    70,    71,    68,    69,    73,    74,
      76,    78,    80,     0,     0,     0,     0,   166,   174,   246,
     248,     0,     0,   277,   281,    91,     0,   254,     0,     0,
     276,     0,     0,   213,   217,   198,     0,   208,     0,   231,
      47,   225,     0,     0,   221,     0,   219,   228,     0,    56,
      37,    33,     0,    31,    35,    83,    86,     0,   159,   167,
       0,     0,   169,   171,   264,   266,   105,   271,     0,   275,
     210,   212,   232,   234,   226,   220,   222,   227,     0,   223,
       0,    41,     0,   172,   174,   168,     0,     0,     0,     0,
       0,     0,     0,   224,    89,   170,   173,   263,   267,   272,
       0,   275,   229,     0,   265,   273,     0,   262,     0,   274
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    37,    38,    39,    40,   103,   104,    85,   133,   134,
     135,   306,   301,   303,   136,   137,   171,   139,   140,   141,
     142,   143,   144,   145,   146,   147,   323,   148,   324,   172,
     325,   173,   269,   174,   336,   150,    86,    87,    70,    71,
      43,    44,   105,    45,    46,    47,    48,    49,   152,    50,
      79,    80,   326,   327,   371,   372,    51,   110,   111,   205,
      72,    64,    53,    65,    55,    56,   194,    66,    58,   281,
     195,   352,   283,   284,   285,   298,   299,   388,   210,   292,
     175,   176,   177,   178,   249,    88,   179,   180,    90,   182,
     183,   414,   184,   397,   398,   185,   186,   187,   188,   399,
     341,   189,   151
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -335
static const yytype_int16 yypact[] =
{
    1045,  -335,  -335,  -335,  -335,  -335,  -335,  -335,  -335,  -335,
     -16,  -335,  -335,  -335,  -335,  -335,  -335,  -335,  -335,  -335,
    -335,  -335,  -335,  -335,  -335,  -335,  -335,  -335,  -335,  -335,
    -335,  -335,     7,  -335,  -335,    13,  -335,    39,  1045,  -335,
    -335,  -335,    12,  1440,  1440,  1440,    28,  -335,  -335,  -335,
      79,  -335,   -30,   677,   -56,   -12,   156,    27,  1395,  -335,
    -335,    79,   -31,    30,   -30,  -335,    27,  -335,  -335,  -335,
     -53,  -335,    18,   677,    27,  -335,  -335,  -335,  1002,  -335,
      26,  -335,   346,    35,  -335,  -335,  -335,    12,   478,  -335,
     677,    16,  1002,  -335,  1002,  -335,  -335,  -335,  -335,  -335,
    -335,  -335,  -335,  -335,   156,  -335,   -56,  -335,  -335,  1395,
     -82,  -335,    46,    79,  -335,   -30,    13,  -335,   458,  -335,
    -335,  -335,  1014,  1027,  1027,  1027,   934,  -335,  -335,  -335,
    -335,  -335,  -335,  -335,  -335,    45,  -335,  1002,  -335,   -26,
      -2,   119,    37,   181,    74,    68,    82,   193,     6,  -335,
    -335,  -335,    85,  -335,   113,  -335,  -335,  1002,  -335,   118,
     124,  -335,  -335,  -335,    79,    98,   104,   496,   106,  -335,
    -335,    97,  -335,  -335,   -48,  -335,   748,  -335,  -335,  -335,
    -335,   478,   562,  -335,  -335,   128,   748,   130,  -335,  -335,
     115,  -335,  -335,  -335,  1526,    29,  -335,  -335,  -335,  -335,
    -335,  -335,    79,  -335,  1002,  -335,   -80,  -335,   458,  -335,
    -335,   934,  -335,  1002,  -335,  -335,  -335,    36,  1304,   138,
    -335,  -335,  -335,   646,  1002,  -335,  -335,  1002,  1002,  1002,
    1002,  1002,  1002,  1002,  1002,  1002,  1002,  1002,  1002,  1002,
    1002,  1002,  1002,  -335,  -335,  -335,  1526,  -335,   121,   122,
    1002,  1002,   125,  -335,  -335,  -335,   -47,  -335,  -335,  -335,
    -335,  -335,  -335,  -335,  -335,  -335,  -335,  -335,  -335,  1002,
    -335,  -335,  -335,  -335,   562,  -335,  -335,  1002,   185,  1002,
    -335,  1176,   144,   143,  -335,  -335,  -335,    79,  -335,  -335,
    -335,  -335,   -54,   148,  -335,  1267,   832,    67,  -335,    73,
    1002,    79,  -335,   154,   152,    88,    79,  -335,  -335,  -335,
     -26,   -26,    -2,    -2,   119,   119,   119,   119,    37,    37,
     181,    74,    68,  1002,  1002,  1002,   744,  -335,   847,  -335,
    -335,    49,    52,  -335,  -335,  -335,  1002,  -335,    57,   158,
     157,   140,  1136,  -335,    23,  -335,  1486,  -335,   309,  -335,
    -335,  -335,   163,   166,  -335,   165,    73,   168,   915,  -335,
    -335,  -335,  1002,  -335,  -335,    82,   193,    -5,  -335,  -335,
    1002,   -42,  -335,   159,  -335,  -335,  -335,  -335,  1002,  1002,
    -335,  -335,  -335,  -335,  -335,  -335,  -335,  -335,  1526,  -335,
     174,  -335,  1002,  -335,    21,  -335,  1002,   748,   748,   748,
      58,   160,   182,  -335,  -335,  -335,  -335,   204,  -335,  -335,
     161,  1002,  -335,   748,  -335,  -335,   187,  -335,   748,  -335
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -335,  -335,  -335,   269,  -335,   206,  -335,   238,  -335,  -335,
    -335,  -335,  -335,   -49,   110,  -335,   135,   -15,   -14,    22,
     -13,    81,    83,    84,     4,    -1,  -335,     8,  -335,   -74,
    -335,  -112,  -335,  -114,  -335,   -65,    11,    60,  -335,   209,
    -335,  -335,  -335,   -51,  -335,  -335,  -335,  -335,  -335,  -335,
    -335,  -335,  -335,     3,  -335,   -64,  -335,   219,   132,  -335,
     -34,     2,   293,   147,  -335,  -335,  -335,     5,  -335,   -55,
    -335,  -185,  -335,   -10,  -105,  -262,  -263,  -335,  -195,  -335,
    -145,  -335,  -335,  -335,  -335,  -335,  -159,   -25,   250,   162,
    -335,  -335,  -335,  -335,  -335,  -335,  -335,  -335,  -335,  -335,
    -334,  -335,     0
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -187
static const yytype_int16 yytable[] =
{
      59,    63,    52,   109,   149,    57,   209,   107,   149,   282,
       1,    41,   217,   291,   244,     1,     1,   154,   149,     1,
     149,   219,   273,   276,     1,   244,     1,   197,    89,   198,
       1,   272,    62,   353,   356,    59,    60,   275,    59,    67,
      52,   278,    59,    57,   202,   401,   202,    74,    89,    41,
      81,   234,   235,   256,   220,   221,   222,    59,   200,    52,
      42,   112,   203,   108,   290,   192,    59,  -186,   115,    78,
    -186,   218,   348,   116,    59,   107,   115,   416,   270,   270,
     353,   356,     1,   149,   394,  -186,  -186,    59,   190,   117,
     349,   196,   248,    82,   271,   334,   209,   217,    42,   217,
     395,   191,   227,    75,    76,    77,   293,   228,   229,    91,
     305,   304,   113,   112,   201,   337,    59,   258,   259,   260,
     261,   262,   263,   264,   265,   266,   267,   230,   231,   275,
     149,   232,   233,    35,    35,   392,   331,   332,   193,   289,
      36,    36,    35,   107,   342,   245,   296,    54,    35,    36,
      61,   286,   114,   383,    69,   287,   218,   335,   294,   118,
     107,   370,   270,   338,   252,   340,   223,   200,   224,  -163,
     225,   374,   236,   237,   375,   270,   190,   155,   270,   377,
     410,   190,   190,   270,   270,    54,   190,   204,   295,    54,
     296,   328,   191,    92,   357,   107,   358,   238,   239,    93,
      94,   240,   112,   402,   106,   241,    95,    96,    97,    98,
      99,   243,   363,   138,   270,   310,   311,   138,   312,   313,
     242,   106,   149,   297,   376,   318,   319,   138,   246,   138,
     200,   355,   212,   214,   215,   216,   209,   247,   268,   250,
     253,   100,   101,   102,   107,   251,   254,   343,   257,   277,
     304,   279,   407,   408,   409,   280,   314,   315,   316,   317,
     300,   329,   330,   339,   400,   340,   345,   333,   417,   346,
     350,   328,   226,   419,   190,   107,   361,   200,   362,   378,
     413,    59,   379,   270,   149,   384,   344,   347,   385,   386,
     387,   107,   138,   390,   373,   107,   149,   340,   403,   396,
     297,   360,   411,   415,   412,   393,   364,    68,    63,   418,
     199,   119,     1,   391,   120,   121,   122,   123,   404,   124,
     125,   320,   149,   366,   321,   207,   322,   365,    59,   369,
     405,   406,   206,   367,   288,    73,   381,   107,   181,   138,
       0,     0,    59,   274,    59,     0,   115,   344,     0,     1,
       0,   120,   121,   122,   123,     0,   124,   125,     0,     0,
     373,     0,   307,   308,   309,   138,   138,   138,   138,   138,
     138,   138,   138,   138,   138,   138,   138,   138,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    59,     0,     0,   190,   190,   190,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   190,     0,     0,     0,     0,   190,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     126,   138,     0,     0,     0,   359,   127,   128,   129,   130,
     131,   132,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   208,   382,     0,     0,     0,     0,   138,   138,
     138,     1,     0,   120,   121,   122,   123,   126,   124,   125,
     153,     0,     0,   127,   128,   129,   130,   131,   132,    83,
       0,     1,     2,   120,   121,   122,   123,     0,   124,   125,
       0,     0,     0,   138,     0,     0,     0,     0,     0,     1,
       0,   120,   121,   122,   123,   138,   124,   125,     3,     4,
       5,     6,     7,     8,     9,     0,    10,    11,    12,     0,
      13,     0,     0,    14,    15,    16,    17,   138,   156,     0,
       0,   138,     0,    18,    19,    20,    21,    22,    23,    24,
       0,    25,    26,    27,    28,    29,    30,    31,    32,     0,
       0,   157,   158,   159,     0,   160,   161,   162,   163,   164,
     165,   166,   167,    83,     0,     1,   168,   120,   121,   122,
     123,     0,   124,   125,     0,     0,     0,     0,     0,   126,
       0,     0,     0,     0,     0,   127,   128,   129,   130,   131,
     132,     0,     0,     0,     0,     0,     0,    33,    34,   126,
       0,   208,     0,     0,     0,   127,   128,   129,   130,   131,
     132,     0,   156,     0,     0,     0,     0,   126,     0,     0,
     169,    84,   170,   127,   128,   129,   130,   131,   132,     0,
       0,     0,     0,     0,     0,   157,   158,   159,   255,   160,
     161,   162,   163,   164,   165,   166,   167,     0,     0,     1,
     168,   120,   121,   122,   123,     0,   124,   125,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    83,     0,
       0,     2,     0,   126,     0,     0,     0,     0,     0,   127,
     128,   129,   130,   131,   132,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   169,    84,   170,     3,     4,     5,
       6,     7,     8,     9,     0,    10,    11,    12,     0,    13,
       0,     0,    14,    15,    16,    17,     0,     0,     0,     0,
       0,     0,    18,    19,    20,    21,    22,    23,    24,     0,
      25,    26,    27,    28,    29,    30,    31,    32,     2,    83,
       0,     1,     0,   120,   121,   122,   123,     0,   124,   125,
       0,     0,     0,     0,     0,     0,     0,   126,   302,     0,
       0,     0,     0,   127,   128,   129,   130,   131,   132,     8,
       9,     0,    10,    11,    12,     0,    13,     0,     0,    14,
      15,    16,    17,     0,     0,     0,    33,    34,   156,    18,
      19,    20,    21,    22,    23,    24,     0,    25,    26,    27,
      28,    29,    30,    31,    32,     0,     0,     0,     0,     0,
      84,   157,   158,   159,     0,   160,   161,   162,   163,   164,
     165,   166,   167,     0,     0,     1,   168,   120,   121,   122,
     123,     0,   124,   125,     0,     0,     0,     0,     0,     0,
       1,     2,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,     0,     0,     0,   126,
       0,     0,     0,     0,     0,   127,   128,   129,   130,   131,
     132,     0,     8,     9,     0,    10,    11,    12,   368,    13,
     169,    84,    14,    15,    16,    17,     0,     0,     0,     0,
       0,     0,    18,    19,    20,    21,    22,    23,    24,     0,
      25,    26,    27,    28,    29,    30,    31,    32,     1,     0,
     120,   121,   122,   123,     0,   124,   125,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     1,     2,   120,
     121,   122,   123,     0,   124,   125,     0,     0,     0,     0,
       0,     0,     0,   126,     0,     0,   354,     0,     0,   127,
     128,   129,   130,   131,   132,     0,     0,    34,    35,     8,
       9,     0,    10,    11,    12,    36,    13,     0,     0,    14,
      15,    16,    17,     0,     0,     0,     0,   370,     0,    18,
      19,    20,    21,    22,    23,    24,     0,    25,    26,    27,
      28,    29,    30,    31,    32,     1,     0,   120,   121,   122,
     123,     0,   124,   125,     0,     0,     0,     1,     0,   120,
     121,   122,   123,     0,   124,   125,     0,     0,     0,     0,
       1,     0,   120,   121,   122,   123,   126,   124,   125,   389,
       0,     0,   127,   128,   129,   130,   131,   132,     1,     2,
       0,     0,     0,     0,    34,   126,     0,     0,     0,     0,
       0,   127,   128,   129,   130,   131,   132,     0,     0,     0,
       0,     0,     0,     0,     0,     3,     4,     5,     6,     7,
       8,     9,     0,    10,    11,    12,     0,    13,     0,     0,
      14,    15,    16,    17,     0,     0,     0,     0,     0,     0,
      18,    19,    20,    21,    22,    23,    24,     0,    25,    26,
      27,    28,    29,    30,    31,    32,     0,     0,     0,     0,
       0,     0,     0,   126,     0,     0,     0,     0,     0,   127,
     128,   129,   130,   131,   132,   211,     0,     0,     0,     1,
       2,   127,   128,   129,   130,   131,   132,     0,   213,     0,
       0,     0,     0,     0,   127,   128,   129,   130,   131,   132,
       0,     0,     0,     0,    33,    34,    35,     0,     0,     0,
       0,     8,     9,    36,    10,    11,    12,     0,    13,     1,
       2,    14,    15,    16,    17,     0,     0,     0,     0,     0,
       0,    18,    19,    20,    21,    22,    23,    24,     0,    25,
      26,    27,    28,    29,    30,    31,    32,     0,     0,     0,
       0,     8,     9,     0,    10,    11,    12,     0,    13,     0,
       0,    14,    15,    16,    17,     0,     0,     0,     0,     0,
       0,    18,    19,    20,    21,    22,    23,    24,     0,    25,
      26,    27,    28,    29,    30,    31,    32,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,   342,   351,   296,
       0,     0,     0,     0,    36,     0,     0,     0,     0,     0,
       0,     2,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,   342,     0,   296,
       0,     0,     8,     9,    36,    10,    11,    12,     2,    13,
       0,     0,    14,    15,    16,    17,     0,     0,     0,     0,
       0,     0,    18,    19,    20,    21,    22,    23,    24,     0,
      25,    26,    27,    28,    29,    30,    31,    32,     0,     8,
       9,     0,    10,    11,    12,     0,    13,     0,     0,    14,
      15,    16,    17,     0,     0,     0,     0,     0,     0,    18,
      19,    20,    21,    22,    23,    24,     0,    25,    26,    27,
      28,    29,    30,    31,    32,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,   295,   351,
     296,     0,     0,     0,     0,    36,     0,     0,     0,     2,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,   295,     0,   296,     0,     0,
       8,     9,    36,    10,    11,    12,     0,    13,     0,     0,
      14,    15,    16,    17,     2,     0,     0,     0,     0,     0,
      18,    19,    20,    21,    22,    23,    24,     0,    25,    26,
      27,    28,    29,    30,    31,    32,     0,     0,     0,     0,
       3,     4,     5,     6,     7,     8,     9,     0,    10,    11,
      12,     0,    13,     0,     0,    14,    15,    16,    17,     0,
       2,     0,     0,     0,     0,    18,    19,    20,    21,    22,
      23,    24,     0,    25,    26,    27,    28,    29,    30,    31,
      32,     0,     0,     0,     0,    34,     0,     0,     0,     0,
       0,     8,     9,    36,    10,    11,    12,     0,    13,     0,
       2,    14,    15,    16,    17,   380,     0,     0,     0,     0,
       0,    18,    19,    20,    21,    22,    23,    24,     0,    25,
      26,    27,    28,    29,    30,    31,    32,     0,     0,    33,
      34,     8,     9,     0,    10,    11,    12,     0,    13,     0,
       0,    14,    15,    16,    17,     0,     0,     0,     0,     0,
       0,    18,    19,    20,    21,    22,    23,    24,     0,    25,
      26,    27,    28,    29,    30,    31,    32,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34
};

static const yytype_int16 yycheck[] =
{
       0,    35,     0,    58,    78,     0,   118,    58,    82,   194,
       3,     0,   126,   208,    19,     3,     3,    82,    92,     3,
      94,   126,   181,   182,     3,    19,     3,    92,    53,    94,
       3,   176,    32,   295,   297,    35,    52,   182,    38,     0,
      38,   186,    42,    38,   126,   379,   126,    42,    73,    38,
      50,    14,    15,   167,     9,    10,    11,    57,   109,    57,
       0,    61,   144,    58,   144,    90,    66,   123,    66,    41,
     126,   126,   126,   126,    74,   126,    74,   411,   126,   126,
     342,   344,     3,   157,   126,   141,   142,    87,    88,   142,
     144,    91,   157,   123,   142,   142,   208,   211,    38,   213,
     142,    90,   128,    43,    44,    45,   211,   133,   134,   121,
     224,   223,   143,   113,   109,   274,   116,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,   129,   130,   274,
     204,    12,    13,   121,   121,   140,   250,   251,   122,   204,
     128,   128,   121,   194,   121,   139,   123,     0,   121,   128,
     143,   122,   122,   348,   142,   126,   211,   269,   122,   141,
     211,   140,   126,   277,   164,   279,   121,   218,   123,   143,
     125,   122,   135,   136,   122,   126,   176,   142,   126,   122,
     122,   181,   182,   126,   126,    38,   186,   141,   121,    42,
     123,   246,   181,    37,   121,   246,   123,    16,    17,    43,
      44,   127,   202,   388,    57,   137,    50,    51,    52,    53,
      54,    18,   124,    78,   126,   230,   231,    82,   232,   233,
     138,    74,   296,   218,   336,   238,   239,    92,   143,    94,
     281,   296,   122,   123,   124,   125,   348,   124,   141,   121,
     142,    85,    86,    87,   295,   121,   142,   281,   142,   121,
     362,   121,   397,   398,   399,   140,   234,   235,   236,   237,
     122,   140,   140,    78,   378,   379,   122,   142,   413,   126,
     122,   326,   137,   418,   274,   326,   122,   328,   126,   121,
      76,   281,   142,   126,   358,   122,   281,   287,   122,   124,
     122,   342,   157,   358,   328,   346,   370,   411,   124,   140,
     295,   301,   142,   142,   122,   370,   306,    38,   342,   122,
     104,    73,     3,   362,     5,     6,     7,     8,   392,    10,
      11,   240,   396,   324,   241,   116,   242,   323,   328,   326,
     394,   396,   113,   325,   202,    42,   346,   388,    88,   204,
      -1,    -1,   342,   181,   344,    -1,   344,   342,    -1,     3,
      -1,     5,     6,     7,     8,    -1,    10,    11,    -1,    -1,
     394,    -1,   227,   228,   229,   230,   231,   232,   233,   234,
     235,   236,   237,   238,   239,   240,   241,   242,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   394,    -1,    -1,   397,   398,   399,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   413,    -1,    -1,    -1,    -1,   418,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     121,   296,    -1,    -1,    -1,   300,   127,   128,   129,   130,
     131,   132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   143,   144,    -1,    -1,    -1,    -1,   323,   324,
     325,     3,    -1,     5,     6,     7,     8,   121,    10,    11,
     124,    -1,    -1,   127,   128,   129,   130,   131,   132,     1,
      -1,     3,     4,     5,     6,     7,     8,    -1,    10,    11,
      -1,    -1,    -1,   358,    -1,    -1,    -1,    -1,    -1,     3,
      -1,     5,     6,     7,     8,   370,    10,    11,    30,    31,
      32,    33,    34,    35,    36,    -1,    38,    39,    40,    -1,
      42,    -1,    -1,    45,    46,    47,    48,   392,    50,    -1,
      -1,   396,    -1,    55,    56,    57,    58,    59,    60,    61,
      -1,    63,    64,    65,    66,    67,    68,    69,    70,    -1,
      -1,    73,    74,    75,    -1,    77,    78,    79,    80,    81,
      82,    83,    84,     1,    -1,     3,    88,     5,     6,     7,
       8,    -1,    10,    11,    -1,    -1,    -1,    -1,    -1,   121,
      -1,    -1,    -1,    -1,    -1,   127,   128,   129,   130,   131,
     132,    -1,    -1,    -1,    -1,    -1,    -1,   119,   120,   121,
      -1,   143,    -1,    -1,    -1,   127,   128,   129,   130,   131,
     132,    -1,    50,    -1,    -1,    -1,    -1,   121,    -1,    -1,
     142,   143,   144,   127,   128,   129,   130,   131,   132,    -1,
      -1,    -1,    -1,    -1,    -1,    73,    74,    75,   142,    77,
      78,    79,    80,    81,    82,    83,    84,    -1,    -1,     3,
      88,     5,     6,     7,     8,    -1,    10,    11,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,
      -1,     4,    -1,   121,    -1,    -1,    -1,    -1,    -1,   127,
     128,   129,   130,   131,   132,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   142,   143,   144,    30,    31,    32,
      33,    34,    35,    36,    -1,    38,    39,    40,    -1,    42,
      -1,    -1,    45,    46,    47,    48,    -1,    -1,    -1,    -1,
      -1,    -1,    55,    56,    57,    58,    59,    60,    61,    -1,
      63,    64,    65,    66,    67,    68,    69,    70,     4,     1,
      -1,     3,    -1,     5,     6,     7,     8,    -1,    10,    11,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   121,   122,    -1,
      -1,    -1,    -1,   127,   128,   129,   130,   131,   132,    35,
      36,    -1,    38,    39,    40,    -1,    42,    -1,    -1,    45,
      46,    47,    48,    -1,    -1,    -1,   119,   120,    50,    55,
      56,    57,    58,    59,    60,    61,    -1,    63,    64,    65,
      66,    67,    68,    69,    70,    -1,    -1,    -1,    -1,    -1,
     143,    73,    74,    75,    -1,    77,    78,    79,    80,    81,
      82,    83,    84,    -1,    -1,     3,    88,     5,     6,     7,
       8,    -1,    10,    11,    -1,    -1,    -1,    -1,    -1,    -1,
       3,     4,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   120,    -1,    -1,    -1,    -1,   121,
      -1,    -1,    -1,    -1,    -1,   127,   128,   129,   130,   131,
     132,    -1,    35,    36,    -1,    38,    39,    40,   144,    42,
     142,   143,    45,    46,    47,    48,    -1,    -1,    -1,    -1,
      -1,    -1,    55,    56,    57,    58,    59,    60,    61,    -1,
      63,    64,    65,    66,    67,    68,    69,    70,     3,    -1,
       5,     6,     7,     8,    -1,    10,    11,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,     4,     5,
       6,     7,     8,    -1,    10,    11,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   121,    -1,    -1,   124,    -1,    -1,   127,
     128,   129,   130,   131,   132,    -1,    -1,   120,   121,    35,
      36,    -1,    38,    39,    40,   128,    42,    -1,    -1,    45,
      46,    47,    48,    -1,    -1,    -1,    -1,   140,    -1,    55,
      56,    57,    58,    59,    60,    61,    -1,    63,    64,    65,
      66,    67,    68,    69,    70,     3,    -1,     5,     6,     7,
       8,    -1,    10,    11,    -1,    -1,    -1,     3,    -1,     5,
       6,     7,     8,    -1,    10,    11,    -1,    -1,    -1,    -1,
       3,    -1,     5,     6,     7,     8,   121,    10,    11,   124,
      -1,    -1,   127,   128,   129,   130,   131,   132,     3,     4,
      -1,    -1,    -1,    -1,   120,   121,    -1,    -1,    -1,    -1,
      -1,   127,   128,   129,   130,   131,   132,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    30,    31,    32,    33,    34,
      35,    36,    -1,    38,    39,    40,    -1,    42,    -1,    -1,
      45,    46,    47,    48,    -1,    -1,    -1,    -1,    -1,    -1,
      55,    56,    57,    58,    59,    60,    61,    -1,    63,    64,
      65,    66,    67,    68,    69,    70,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   121,    -1,    -1,    -1,    -1,    -1,   127,
     128,   129,   130,   131,   132,   121,    -1,    -1,    -1,     3,
       4,   127,   128,   129,   130,   131,   132,    -1,   121,    -1,
      -1,    -1,    -1,    -1,   127,   128,   129,   130,   131,   132,
      -1,    -1,    -1,    -1,   119,   120,   121,    -1,    -1,    -1,
      -1,    35,    36,   128,    38,    39,    40,    -1,    42,     3,
       4,    45,    46,    47,    48,    -1,    -1,    -1,    -1,    -1,
      -1,    55,    56,    57,    58,    59,    60,    61,    -1,    63,
      64,    65,    66,    67,    68,    69,    70,    -1,    -1,    -1,
      -1,    35,    36,    -1,    38,    39,    40,    -1,    42,    -1,
      -1,    45,    46,    47,    48,    -1,    -1,    -1,    -1,    -1,
      -1,    55,    56,    57,    58,    59,    60,    61,    -1,    63,
      64,    65,    66,    67,    68,    69,    70,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   120,   121,   122,   123,
      -1,    -1,    -1,    -1,   128,    -1,    -1,    -1,    -1,    -1,
      -1,     4,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   120,   121,    -1,   123,
      -1,    -1,    35,    36,   128,    38,    39,    40,     4,    42,
      -1,    -1,    45,    46,    47,    48,    -1,    -1,    -1,    -1,
      -1,    -1,    55,    56,    57,    58,    59,    60,    61,    -1,
      63,    64,    65,    66,    67,    68,    69,    70,    -1,    35,
      36,    -1,    38,    39,    40,    -1,    42,    -1,    -1,    45,
      46,    47,    48,    -1,    -1,    -1,    -1,    -1,    -1,    55,
      56,    57,    58,    59,    60,    61,    -1,    63,    64,    65,
      66,    67,    68,    69,    70,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   120,   121,   122,
     123,    -1,    -1,    -1,    -1,   128,    -1,    -1,    -1,     4,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   120,   121,    -1,   123,    -1,    -1,
      35,    36,   128,    38,    39,    40,    -1,    42,    -1,    -1,
      45,    46,    47,    48,     4,    -1,    -1,    -1,    -1,    -1,
      55,    56,    57,    58,    59,    60,    61,    -1,    63,    64,
      65,    66,    67,    68,    69,    70,    -1,    -1,    -1,    -1,
      30,    31,    32,    33,    34,    35,    36,    -1,    38,    39,
      40,    -1,    42,    -1,    -1,    45,    46,    47,    48,    -1,
       4,    -1,    -1,    -1,    -1,    55,    56,    57,    58,    59,
      60,    61,    -1,    63,    64,    65,    66,    67,    68,    69,
      70,    -1,    -1,    -1,    -1,   120,    -1,    -1,    -1,    -1,
      -1,    35,    36,   128,    38,    39,    40,    -1,    42,    -1,
       4,    45,    46,    47,    48,    49,    -1,    -1,    -1,    -1,
      -1,    55,    56,    57,    58,    59,    60,    61,    -1,    63,
      64,    65,    66,    67,    68,    69,    70,    -1,    -1,   119,
     120,    35,    36,    -1,    38,    39,    40,    -1,    42,    -1,
      -1,    45,    46,    47,    48,    -1,    -1,    -1,    -1,    -1,
      -1,    55,    56,    57,    58,    59,    60,    61,    -1,    63,
      64,    65,    66,    67,    68,    69,    70,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   120,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   120
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     3,     4,    30,    31,    32,    33,    34,    35,    36,
      38,    39,    40,    42,    45,    46,    47,    48,    55,    56,
      57,    58,    59,    60,    61,    63,    64,    65,    66,    67,
      68,    69,    70,   119,   120,   121,   128,   146,   147,   148,
     149,   181,   182,   185,   186,   188,   189,   190,   191,   192,
     194,   201,   206,   207,   208,   209,   210,   212,   213,   247,
      52,   143,   247,   205,   206,   208,   212,     0,   148,   142,
     183,   184,   205,   207,   212,   182,   182,   182,    41,   195,
     196,   247,   123,     1,   143,   152,   181,   182,   230,   232,
     233,   121,    37,    43,    44,    50,    51,    52,    53,    54,
      85,    86,    87,   150,   151,   187,   208,   188,   212,   214,
     202,   203,   247,   143,   122,   206,   126,   142,   141,   152,
       5,     6,     7,     8,    10,    11,   121,   127,   128,   129,
     130,   131,   132,   153,   154,   155,   159,   160,   161,   162,
     163,   164,   165,   166,   167,   168,   169,   170,   172,   174,
     180,   247,   193,   124,   180,   142,    50,    73,    74,    75,
      77,    78,    79,    80,    81,    82,    83,    84,    88,   142,
     144,   161,   174,   176,   178,   225,   226,   227,   228,   231,
     232,   233,   234,   235,   237,   240,   241,   242,   243,   246,
     247,   181,   232,   122,   211,   215,   247,   180,   180,   150,
     188,   212,   126,   144,   141,   204,   202,   184,   143,   176,
     223,   121,   159,   121,   159,   159,   159,   178,   214,   219,
       9,    10,    11,   121,   123,   125,   161,   128,   133,   134,
     129,   130,    12,    13,    14,    15,   135,   136,    16,    17,
     127,   137,   138,    18,    19,   139,   143,   124,   180,   229,
     121,   121,   247,   142,   142,   142,   178,   142,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,   141,   177,
     126,   142,   225,   231,   234,   225,   231,   121,   225,   121,
     140,   214,   216,   217,   218,   219,   122,   126,   203,   180,
     144,   223,   224,   219,   122,   121,   123,   212,   220,   221,
     122,   157,   122,   158,   176,   178,   156,   161,   161,   161,
     162,   162,   163,   163,   164,   164,   164,   164,   165,   165,
     166,   167,   168,   171,   173,   175,   197,   198,   214,   140,
     140,   178,   178,   142,   142,   176,   179,   231,   178,    78,
     178,   245,   121,   205,   212,   122,   126,   247,   126,   144,
     122,   122,   216,   220,   124,   180,   221,   121,   123,   161,
     247,   122,   126,   124,   247,   169,   170,   172,   144,   198,
     140,   199,   200,   205,   122,   122,   176,   122,   121,   142,
      49,   218,   144,   223,   122,   122,   124,   122,   222,   124,
     180,   158,   140,   180,   126,   142,   140,   238,   239,   244,
     178,   245,   216,   124,   174,   200,   180,   225,   225,   225,
     122,   142,   122,    76,   236,   142,   245,   225,   122,   225
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
	      (Loc).first_line, (Loc).first_column,	\
	      (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *bottom, yytype_int16 *top)
#else
static void
yy_stack_print (bottom, top)
    yytype_int16 *bottom;
    yytype_int16 *top;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; bottom <= top; ++bottom)
    YYFPRINTF (stderr, " %d", *bottom);
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      fprintf (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      fprintf (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
      char *yyfmt;
      char const *yyf;
      static char const yyunexpected[] = "syntax error, unexpected %s";
      static char const yyexpecting[] = ", expecting %s";
      static char const yyor[] = " or %s";
      char yyformat[sizeof yyunexpected
		    + sizeof yyexpecting - 1
		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
		       * (sizeof yyor - 1))];
      char const *yyprefix = yyexpecting;

      /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;

      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yycount = 1;

      yyarg[0] = yytname[yytype];
      yyfmt = yystpcpy (yyformat, yyunexpected);

      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
	      {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
	      }
	    yyarg[yycount++] = yytname[yyx];
	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
	    {
	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
	      else
		{
		  yyp++;
		  yyf++;
		}
	    }
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}


/* Prevent warnings from -Wmissing-prototypes.  */

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */



/* The look-ahead symbol.  */
int yychar;

/* The semantic value of the look-ahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;



/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{
  
  int yystate;
  int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Look-ahead token as an internal (translated) token number.  */
  int yytoken = 0;
#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

  /* Three stacks and their tools:
     `yyss': related to states,
     `yyvs': related to semantic values,
     `yyls': related to locations.

     Refer to the stacks thru separate pointers, to allow yyoverflow
     to reallocate them elsewhere.  */

  /* The state stack.  */
  yytype_int16 yyssa[YYINITDEPTH];
  yytype_int16 *yyss = yyssa;
  yytype_int16 *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  YYSTYPE *yyvsp;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  YYSIZE_T yystacksize = YYINITDEPTH;

  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;


  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */

  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;


	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),

		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss);
	YYSTACK_RELOCATE (yyvs);

#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;


      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     look-ahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to look-ahead token.  */
  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a look-ahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid look-ahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the look-ahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 137 "SDCC.y"
    { if (!options.lessPedantic)
                    werror(W_EMPTY_SOURCE_FILE);
        }
    break;

  case 6:
#line 149 "SDCC.y"
    {
                               blockNo=0;
                             }
    break;

  case 7:
#line 152 "SDCC.y"
    {
                               ignoreTypedefType = 0;
                               if ((yyvsp[(1) - (1)].sym) && (yyvsp[(1) - (1)].sym)->type
                                && IS_FUNC((yyvsp[(1) - (1)].sym)->type))
                               {
                                   /* The only legal storage classes for
                                    * a function prototype (declaration)
                                    * are extern and static. extern is the
                                    * default. Thus, if this function isn't
                                    * explicitly marked static, mark it
                                    * extern.
                                    */
                                   if ((yyvsp[(1) - (1)].sym)->etype
                                    && IS_SPEC((yyvsp[(1) - (1)].sym)->etype)
                                    && !SPEC_STAT((yyvsp[(1) - (1)].sym)->etype))
                                   {
                                        SPEC_EXTR((yyvsp[(1) - (1)].sym)->etype) = 1;
                                   }
                               }
                               addSymChain (&(yyvsp[(1) - (1)].sym));
                               allocVariables ((yyvsp[(1) - (1)].sym)) ;
                               cleanUpLevel (SymbolTab,1);
                             }
    break;

  case 8:
#line 178 "SDCC.y"
    {   /* function type not specified */
                                   /* assume it to be 'int'       */
                                   addDecl((yyvsp[(1) - (2)].sym),0,newIntLink());
                                   (yyval.asts) = createFunction((yyvsp[(1) - (2)].sym),(yyvsp[(2) - (2)].asts));
                               }
    break;

  case 9:
#line 184 "SDCC.y"
    {
                                    pointerTypes((yyvsp[(2) - (3)].sym)->type,copyLinkChain((yyvsp[(1) - (3)].lnk)));
                                    if (options.unsigned_char && SPEC_NOUN((yyvsp[(1) - (3)].lnk)) == V_CHAR && !((yyvsp[(1) - (3)].lnk))->select.s.b_signed)
                                      SPEC_USIGN((yyvsp[(1) - (3)].lnk)) = 1;
                                    addDecl((yyvsp[(2) - (3)].sym),0,(yyvsp[(1) - (3)].lnk));
                                    (yyval.asts) = createFunction((yyvsp[(2) - (3)].sym),(yyvsp[(3) - (3)].asts));
                                }
    break;

  case 11:
#line 195 "SDCC.y"
    { (yyval.lnk) = mergeSpec((yyvsp[(1) - (2)].lnk),(yyvsp[(2) - (2)].lnk),"function_attribute"); }
    break;

  case 12:
#line 199 "SDCC.y"
    {
                        (yyval.lnk) = newLink(SPECIFIER) ;
                        FUNC_REGBANK((yyval.lnk)) = (int) ulFromVal(constExprValue((yyvsp[(2) - (2)].asts),TRUE));
                     }
    break;

  case 13:
#line 203 "SDCC.y"
    {  (yyval.lnk) = newLink (SPECIFIER);
                        FUNC_ISREENT((yyval.lnk))=1;
                     }
    break;

  case 14:
#line 206 "SDCC.y"
    {  (yyval.lnk) = newLink (SPECIFIER);
                        FUNC_ISCRITICAL((yyval.lnk)) = 1;
                     }
    break;

  case 15:
#line 209 "SDCC.y"
    {  (yyval.lnk) = newLink (SPECIFIER);
                        FUNC_ISNAKED((yyval.lnk))=1;
                     }
    break;

  case 16:
#line 212 "SDCC.y"
    {  (yyval.lnk) = newLink (SPECIFIER);
                        FUNC_ISJAVANATIVE((yyval.lnk))=1;
                     }
    break;

  case 17:
#line 215 "SDCC.y"
    {  (yyval.lnk) = newLink (SPECIFIER);
                        FUNC_ISOVERLAY((yyval.lnk))=1;
                     }
    break;

  case 18:
#line 218 "SDCC.y"
    {(yyval.lnk) = newLink (SPECIFIER);
                        FUNC_NONBANKED((yyval.lnk)) = 1;
                        if (FUNC_BANKED((yyval.lnk))) {
                            werror(W_BANKED_WITH_NONBANKED);
                        }
                     }
    break;

  case 19:
#line 224 "SDCC.y"
    {(yyval.lnk) = newLink (SPECIFIER);
                        FUNC_ISSHADOWREGS((yyval.lnk)) = 1;
                     }
    break;

  case 20:
#line 227 "SDCC.y"
    {(yyval.lnk) = newLink (SPECIFIER);
                        FUNC_ISWPARAM((yyval.lnk)) = 1;
                     }
    break;

  case 21:
#line 230 "SDCC.y"
    {(yyval.lnk) = newLink (SPECIFIER);
                        FUNC_BANKED((yyval.lnk)) = 1;
                        if (FUNC_NONBANKED((yyval.lnk))) {
                            werror(W_BANKED_WITH_NONBANKED);
                        }
                        if (SPEC_STAT((yyval.lnk))) {
                            werror(W_BANKED_WITH_STATIC);
                        }
                     }
    break;

  case 22:
#line 240 "SDCC.y"
    {
                        (yyval.lnk) = newLink (SPECIFIER) ;
                        FUNC_INTNO((yyval.lnk)) = (yyvsp[(1) - (1)].yyint) ;
                        FUNC_ISISR((yyval.lnk)) = 1;
                     }
    break;

  case 24:
#line 250 "SDCC.y"
    {
            werror(E_OLD_STYLE,((yyvsp[(1) - (2)].sym) ? (yyvsp[(1) - (2)].sym)->name: "")) ;
            exit(1);
         }
    break;

  case 25:
#line 257 "SDCC.y"
    {  (yyval.asts) = newAst_VALUE(symbolVal((yyvsp[(1) - (1)].sym)));  }
    break;

  case 26:
#line 258 "SDCC.y"
    {  (yyval.asts) = newAst_VALUE((yyvsp[(1) - (1)].val));  }
    break;

  case 28:
#line 260 "SDCC.y"
    {  (yyval.asts) = (yyvsp[(2) - (3)].asts) ;                   }
    break;

  case 29:
#line 264 "SDCC.y"
    { (yyval.asts) = newAst_VALUE((yyvsp[(1) - (1)].val)); }
    break;

  case 31:
#line 269 "SDCC.y"
    { (yyval.asts) = newNode  ('[', (yyvsp[(1) - (4)].asts), (yyvsp[(3) - (4)].asts)) ; }
    break;

  case 32:
#line 270 "SDCC.y"
    { (yyval.asts) = newNode  (CALL,(yyvsp[(1) - (3)].asts),NULL);
                                          (yyval.asts)->left->funcName = 1;}
    break;

  case 33:
#line 273 "SDCC.y"
    {
            (yyval.asts) = newNode  (CALL,(yyvsp[(1) - (4)].asts),(yyvsp[(3) - (4)].asts)) ; (yyval.asts)->left->funcName = 1;
          }
    break;

  case 34:
#line 276 "SDCC.y"
    { ignoreTypedefType = 1; }
    break;

  case 35:
#line 277 "SDCC.y"
    {
                        ignoreTypedefType = 0;
                        (yyvsp[(4) - (4)].sym) = newSymbol((yyvsp[(4) - (4)].sym)->name,NestLevel);
                        (yyvsp[(4) - (4)].sym)->implicit = 1;
                        (yyval.asts) = newNode(PTR_OP,newNode('&',(yyvsp[(1) - (4)].asts),NULL),newAst_VALUE(symbolVal((yyvsp[(4) - (4)].sym))));
/*                      $$ = newNode('.',$1,newAst(EX_VALUE,symbolVal($4))) ;                   */
                      }
    break;

  case 36:
#line 284 "SDCC.y"
    { ignoreTypedefType = 1; }
    break;

  case 37:
#line 285 "SDCC.y"
    {
                        ignoreTypedefType = 0;
                        (yyvsp[(4) - (4)].sym) = newSymbol((yyvsp[(4) - (4)].sym)->name,NestLevel);
                        (yyvsp[(4) - (4)].sym)->implicit = 1;
                        (yyval.asts) = newNode(PTR_OP,(yyvsp[(1) - (4)].asts),newAst_VALUE(symbolVal((yyvsp[(4) - (4)].sym))));
                      }
    break;

  case 38:
#line 292 "SDCC.y"
    { (yyval.asts) = newNode(INC_OP,(yyvsp[(1) - (2)].asts),NULL);}
    break;

  case 39:
#line 294 "SDCC.y"
    { (yyval.asts) = newNode(DEC_OP,(yyvsp[(1) - (2)].asts),NULL); }
    break;

  case 41:
#line 299 "SDCC.y"
    { (yyval.asts) = newNode(PARAM,(yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts)); }
    break;

  case 43:
#line 304 "SDCC.y"
    { (yyval.asts) = newNode(INC_OP,NULL,(yyvsp[(2) - (2)].asts));  }
    break;

  case 44:
#line 305 "SDCC.y"
    { (yyval.asts) = newNode(DEC_OP,NULL,(yyvsp[(2) - (2)].asts));  }
    break;

  case 45:
#line 306 "SDCC.y"
    { (yyval.asts) = newNode((yyvsp[(1) - (2)].yyint),(yyvsp[(2) - (2)].asts),NULL)    ;  }
    break;

  case 46:
#line 307 "SDCC.y"
    { (yyval.asts) = newNode(SIZEOF,NULL,(yyvsp[(2) - (2)].asts));  }
    break;

  case 47:
#line 308 "SDCC.y"
    { (yyval.asts) = newAst_VALUE(sizeofOp((yyvsp[(3) - (4)].lnk))); }
    break;

  case 48:
#line 309 "SDCC.y"
    { (yyval.asts) = newNode(TYPEOF,NULL,(yyvsp[(2) - (2)].asts));  }
    break;

  case 49:
#line 313 "SDCC.y"
    { (yyval.yyint) = '&' ;}
    break;

  case 50:
#line 314 "SDCC.y"
    { (yyval.yyint) = '*' ;}
    break;

  case 51:
#line 315 "SDCC.y"
    { (yyval.yyint) = '+' ;}
    break;

  case 52:
#line 316 "SDCC.y"
    { (yyval.yyint) = '-' ;}
    break;

  case 53:
#line 317 "SDCC.y"
    { (yyval.yyint) = '~' ;}
    break;

  case 54:
#line 318 "SDCC.y"
    { (yyval.yyint) = '!' ;}
    break;

  case 56:
#line 323 "SDCC.y"
    { (yyval.asts) = newNode(CAST,newAst_LINK((yyvsp[(2) - (4)].lnk)),(yyvsp[(4) - (4)].asts)); }
    break;

  case 58:
#line 328 "SDCC.y"
    { (yyval.asts) = newNode('*',(yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts));}
    break;

  case 59:
#line 329 "SDCC.y"
    { (yyval.asts) = newNode('/',(yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts));}
    break;

  case 60:
#line 330 "SDCC.y"
    { (yyval.asts) = newNode('%',(yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts));}
    break;

  case 62:
#line 335 "SDCC.y"
    { (yyval.asts)=newNode('+',(yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts));}
    break;

  case 63:
#line 336 "SDCC.y"
    { (yyval.asts)=newNode('-',(yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts));}
    break;

  case 65:
#line 341 "SDCC.y"
    { (yyval.asts) = newNode(LEFT_OP,(yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts)); }
    break;

  case 66:
#line 342 "SDCC.y"
    { (yyval.asts) = newNode(RIGHT_OP,(yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts)); }
    break;

  case 68:
#line 347 "SDCC.y"
    { (yyval.asts) = newNode('<',  (yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts));}
    break;

  case 69:
#line 348 "SDCC.y"
    { (yyval.asts) = newNode('>',  (yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts));}
    break;

  case 70:
#line 349 "SDCC.y"
    { (yyval.asts) = newNode(LE_OP,(yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts));}
    break;

  case 71:
#line 350 "SDCC.y"
    { (yyval.asts) = newNode(GE_OP,(yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts));}
    break;

  case 73:
#line 355 "SDCC.y"
    { (yyval.asts) = newNode(EQ_OP,(yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts));}
    break;

  case 74:
#line 356 "SDCC.y"
    { (yyval.asts) = newNode(NE_OP,(yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts));}
    break;

  case 76:
#line 361 "SDCC.y"
    { (yyval.asts) = newNode('&',(yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts));}
    break;

  case 78:
#line 366 "SDCC.y"
    { (yyval.asts) = newNode('^',(yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts));}
    break;

  case 80:
#line 371 "SDCC.y"
    { (yyval.asts) = newNode('|',(yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts));}
    break;

  case 82:
#line 376 "SDCC.y"
    { seqPointNo++;}
    break;

  case 83:
#line 377 "SDCC.y"
    { (yyval.asts) = newNode(AND_OP,(yyvsp[(1) - (4)].asts),(yyvsp[(4) - (4)].asts));}
    break;

  case 85:
#line 382 "SDCC.y"
    { seqPointNo++;}
    break;

  case 86:
#line 383 "SDCC.y"
    { (yyval.asts) = newNode(OR_OP,(yyvsp[(1) - (4)].asts),(yyvsp[(4) - (4)].asts)); }
    break;

  case 88:
#line 388 "SDCC.y"
    { seqPointNo++;}
    break;

  case 89:
#line 389 "SDCC.y"
    {
                        (yyval.asts) = newNode(':',(yyvsp[(4) - (6)].asts),(yyvsp[(6) - (6)].asts)) ;
                        (yyval.asts) = newNode('?',(yyvsp[(1) - (6)].asts),(yyval.asts)) ;
                     }
    break;

  case 91:
#line 398 "SDCC.y"
    {

                             switch ((yyvsp[(2) - (3)].yyint)) {
                             case '=':
                                     (yyval.asts) = newNode((yyvsp[(2) - (3)].yyint),(yyvsp[(1) - (3)].asts),(yyvsp[(3) - (3)].asts));
                                     break;
                             case MUL_ASSIGN:
                                     (yyval.asts) = createRMW((yyvsp[(1) - (3)].asts), '*', (yyvsp[(3) - (3)].asts));
                                     break;
                             case DIV_ASSIGN:
                                     (yyval.asts) = createRMW((yyvsp[(1) - (3)].asts), '/', (yyvsp[(3) - (3)].asts));
                                     break;
                             case MOD_ASSIGN:
                                     (yyval.asts) = createRMW((yyvsp[(1) - (3)].asts), '%', (yyvsp[(3) - (3)].asts));
                                     break;
                             case ADD_ASSIGN:
                                     (yyval.asts) = createRMW((yyvsp[(1) - (3)].asts), '+', (yyvsp[(3) - (3)].asts));
                                     break;
                             case SUB_ASSIGN:
                                     (yyval.asts) = createRMW((yyvsp[(1) - (3)].asts), '-', (yyvsp[(3) - (3)].asts));
                                     break;
                             case LEFT_ASSIGN:
                                     (yyval.asts) = createRMW((yyvsp[(1) - (3)].asts), LEFT_OP, (yyvsp[(3) - (3)].asts));
                                     break;
                             case RIGHT_ASSIGN:
                                     (yyval.asts) = createRMW((yyvsp[(1) - (3)].asts), RIGHT_OP, (yyvsp[(3) - (3)].asts));
                                     break;
                             case AND_ASSIGN:
                                     (yyval.asts) = createRMW((yyvsp[(1) - (3)].asts), '&', (yyvsp[(3) - (3)].asts));
                                     break;
                             case XOR_ASSIGN:
                                     (yyval.asts) = createRMW((yyvsp[(1) - (3)].asts), '^', (yyvsp[(3) - (3)].asts));
                                     break;
                             case OR_ASSIGN:
/*                                   $$ = newNode('=',$1,newNode('|',removeIncDecOps(copyAst($1)),$3)); */
/*                                   $$ = newNode('=',removePostIncDecOps(copyAst($1)),
                                                      newNode('|',removePreIncDecOps(copyAst($1)),$3)); */
                                     (yyval.asts) = createRMW((yyvsp[(1) - (3)].asts), '|', (yyvsp[(3) - (3)].asts));
                                     break;
                             default :
                                     (yyval.asts) = NULL;
                             }

                     }
    break;

  case 92:
#line 445 "SDCC.y"
    { (yyval.yyint) = '=' ;}
    break;

  case 104:
#line 460 "SDCC.y"
    { seqPointNo++;}
    break;

  case 105:
#line 460 "SDCC.y"
    { (yyval.asts) = newNode(',',(yyvsp[(1) - (4)].asts),(yyvsp[(4) - (4)].asts));}
    break;

  case 107:
#line 469 "SDCC.y"
    {
         if (uselessDecl)
           werror(W_USELESS_DECL);
         uselessDecl = TRUE;
         (yyval.sym) = NULL ;
      }
    break;

  case 108:
#line 476 "SDCC.y"
    {
         /* add the specifier list to the id */
         symbol *sym , *sym1;

         for (sym1 = sym = reverseSyms((yyvsp[(2) - (3)].sym));sym != NULL;sym = sym->next) {
             sym_link *lnk = copyLinkChain((yyvsp[(1) - (3)].lnk));
             if (options.unsigned_char && SPEC_NOUN(lnk) == V_CHAR && !lnk->select.s.b_signed)
               SPEC_USIGN(lnk) = 1;
             /* do the pointer stuff */
             pointerTypes(sym->type,lnk);
             addDecl (sym,0,lnk) ;
         }

         uselessDecl = TRUE;
         (yyval.sym) = sym1 ;
      }
    break;

  case 109:
#line 495 "SDCC.y"
    { (yyval.lnk) = (yyvsp[(1) - (1)].lnk); }
    break;

  case 110:
#line 496 "SDCC.y"
    {
     /* if the decl $2 is not a specifier */
     /* find the spec and replace it      */
     if ( !IS_SPEC((yyvsp[(2) - (2)].lnk))) {
       sym_link *lnk = (yyvsp[(2) - (2)].lnk) ;
       while (lnk && !IS_SPEC(lnk->next))
         lnk = lnk->next;
       lnk->next = mergeSpec((yyvsp[(1) - (2)].lnk),lnk->next, "storage_class_specifier declaration_specifiers - skipped");
       (yyval.lnk) = (yyvsp[(2) - (2)].lnk) ;
     }
     else
       (yyval.lnk) = mergeSpec((yyvsp[(1) - (2)].lnk),(yyvsp[(2) - (2)].lnk), "storage_class_specifier declaration_specifiers");
   }
    break;

  case 111:
#line 509 "SDCC.y"
    { (yyval.lnk) = (yyvsp[(1) - (1)].lnk); }
    break;

  case 112:
#line 510 "SDCC.y"
    {
     /* if the decl $2 is not a specifier */
     /* find the spec and replace it      */
     if ( !IS_SPEC((yyvsp[(2) - (2)].lnk))) {
       sym_link *lnk = (yyvsp[(2) - (2)].lnk) ;
       while (lnk && !IS_SPEC(lnk->next))
         lnk = lnk->next;
       lnk->next = mergeSpec((yyvsp[(1) - (2)].lnk),lnk->next, "type_specifier declaration_specifiers - skipped");
       (yyval.lnk) = (yyvsp[(2) - (2)].lnk) ;
     }
     else
       (yyval.lnk) = mergeSpec((yyvsp[(1) - (2)].lnk),(yyvsp[(2) - (2)].lnk), "type_specifier declaration_specifiers");
   }
    break;

  case 113:
#line 523 "SDCC.y"
    { (yyval.lnk) = (yyvsp[(1) - (1)].lnk); }
    break;

  case 114:
#line 524 "SDCC.y"
    {
     /* if the decl $2 is not a specifier */
     /* find the spec and replace it      */
     if ( !IS_SPEC((yyvsp[(2) - (2)].lnk))) {
       sym_link *lnk = (yyvsp[(2) - (2)].lnk) ;
       while (lnk && !IS_SPEC(lnk->next))
         lnk = lnk->next;
       lnk->next = mergeSpec((yyvsp[(1) - (2)].lnk),lnk->next, "function_specifier declaration_specifiers - skipped");
       (yyval.lnk) = (yyvsp[(2) - (2)].lnk) ;
     }
     else
       (yyval.lnk) = mergeSpec((yyvsp[(1) - (2)].lnk),(yyvsp[(2) - (2)].lnk), "function_specifier declaration_specifiers");
   }
    break;

  case 116:
#line 541 "SDCC.y"
    { (yyvsp[(3) - (3)].sym)->next = (yyvsp[(1) - (3)].sym) ; (yyval.sym) = (yyvsp[(3) - (3)].sym);}
    break;

  case 117:
#line 545 "SDCC.y"
    { (yyvsp[(1) - (1)].sym)->ival = NULL ; }
    break;

  case 118:
#line 546 "SDCC.y"
    { (yyvsp[(1) - (3)].sym)->ival = (yyvsp[(3) - (3)].ilist)   ; }
    break;

  case 119:
#line 551 "SDCC.y"
    {
                  (yyval.lnk) = newLink (SPECIFIER) ;
                  SPEC_TYPEDEF((yyval.lnk)) = 1 ;
               }
    break;

  case 120:
#line 555 "SDCC.y"
    {
                  (yyval.lnk) = newLink(SPECIFIER);
                  SPEC_EXTR((yyval.lnk)) = 1 ;
               }
    break;

  case 121:
#line 559 "SDCC.y"
    {
                  (yyval.lnk) = newLink (SPECIFIER);
                  SPEC_STAT((yyval.lnk)) = 1 ;
               }
    break;

  case 122:
#line 563 "SDCC.y"
    {
                  (yyval.lnk) = newLink (SPECIFIER) ;
                  SPEC_SCLS((yyval.lnk)) = S_AUTO  ;
               }
    break;

  case 123:
#line 567 "SDCC.y"
    {
                  (yyval.lnk) = newLink (SPECIFIER);
                  SPEC_SCLS((yyval.lnk)) = S_REGISTER ;
               }
    break;

  case 124:
#line 574 "SDCC.y"
    {
                  (yyval.lnk) = newLink (SPECIFIER) ;
                  SPEC_INLINE((yyval.lnk)) = 1 ;
               }
    break;

  case 125:
#line 581 "SDCC.y"
    { (yyval.yyint) = INTNO_UNSPEC ; }
    break;

  case 126:
#line 583 "SDCC.y"
    { int intno = (int) ulFromVal(constExprValue((yyvsp[(2) - (2)].asts),TRUE));
          if ((intno >= 0) && (intno <= INTNO_MAX))
            (yyval.yyint) = intno;
          else
            {
              werror(E_INT_BAD_INTNO, intno);
              (yyval.yyint) = INTNO_UNSPEC;
            }
        }
    break;

  case 128:
#line 597 "SDCC.y"
    {
           /* add this to the storage class specifier  */
           SPEC_ABSA((yyvsp[(1) - (3)].lnk)) = 1;   /* set the absolute addr flag */
           /* now get the abs addr from value */
           SPEC_ADDR((yyvsp[(1) - (3)].lnk)) = (unsigned int) ulFromVal(constExprValue((yyvsp[(3) - (3)].asts),TRUE)) ;
        }
    break;

  case 129:
#line 606 "SDCC.y"
    {
                  (yyval.lnk)=newLink(SPECIFIER);
                  SPEC_NOUN((yyval.lnk)) = V_CHAR  ;
                  ignoreTypedefType = 1;
               }
    break;

  case 130:
#line 611 "SDCC.y"
    {
                  (yyval.lnk)=newLink(SPECIFIER);
                  SPEC_SHORT((yyval.lnk)) = 1 ;
                  ignoreTypedefType = 1;
               }
    break;

  case 131:
#line 616 "SDCC.y"
    {
                  (yyval.lnk)=newLink(SPECIFIER);
                  SPEC_NOUN((yyval.lnk)) = V_INT   ;
                  ignoreTypedefType = 1;
               }
    break;

  case 132:
#line 621 "SDCC.y"
    {
                  (yyval.lnk)=newLink(SPECIFIER);
                  SPEC_LONG((yyval.lnk)) = 1       ;
                  ignoreTypedefType = 1;
               }
    break;

  case 133:
#line 626 "SDCC.y"
    {
                  (yyval.lnk)=newLink(SPECIFIER);
                  (yyval.lnk)->select.s.b_signed = 1;
                  ignoreTypedefType = 1;
               }
    break;

  case 134:
#line 631 "SDCC.y"
    {
                  (yyval.lnk)=newLink(SPECIFIER);
                  SPEC_USIGN((yyval.lnk)) = 1      ;
                  ignoreTypedefType = 1;
               }
    break;

  case 135:
#line 636 "SDCC.y"
    {
                  (yyval.lnk)=newLink(SPECIFIER);
                  SPEC_NOUN((yyval.lnk)) = V_VOID  ;
                  ignoreTypedefType = 1;
               }
    break;

  case 136:
#line 641 "SDCC.y"
    {
                  (yyval.lnk)=newLink(SPECIFIER);
                  SPEC_CONST((yyval.lnk)) = 1;
               }
    break;

  case 137:
#line 645 "SDCC.y"
    {
                  (yyval.lnk)=newLink(SPECIFIER);
                  SPEC_VOLATILE((yyval.lnk)) = 1 ;
               }
    break;

  case 138:
#line 649 "SDCC.y"
    {
                  (yyval.lnk)=newLink(SPECIFIER);
                  SPEC_RESTRICT((yyval.lnk)) = 1 ;
               }
    break;

  case 139:
#line 653 "SDCC.y"
    {
                  (yyval.lnk)=newLink(SPECIFIER);
                  SPEC_NOUN((yyval.lnk)) = V_FLOAT;
                  ignoreTypedefType = 1;
               }
    break;

  case 140:
#line 658 "SDCC.y"
    {
                  (yyval.lnk)=newLink(SPECIFIER);
                  SPEC_NOUN((yyval.lnk)) = V_FIXED16X16;
                  ignoreTypedefType = 1;
               }
    break;

  case 141:
#line 663 "SDCC.y"
    {
                  (yyval.lnk) = newLink (SPECIFIER);
                  SPEC_SCLS((yyval.lnk)) = S_XDATA  ;
               }
    break;

  case 142:
#line 667 "SDCC.y"
    {
                  (yyval.lnk) = newLink (SPECIFIER) ;
                  SPEC_SCLS((yyval.lnk)) = S_CODE ;
               }
    break;

  case 143:
#line 671 "SDCC.y"
    {
                  (yyval.lnk) = newLink (SPECIFIER) ;
                  SPEC_SCLS((yyval.lnk)) = S_EEPROM ;
               }
    break;

  case 144:
#line 675 "SDCC.y"
    {
                  (yyval.lnk) = newLink (SPECIFIER);
                  SPEC_SCLS((yyval.lnk)) = S_DATA   ;
               }
    break;

  case 145:
#line 679 "SDCC.y"
    {
                  (yyval.lnk) = newLink (SPECIFIER);
                  SPEC_SCLS((yyval.lnk)) = S_IDATA  ;
               }
    break;

  case 146:
#line 683 "SDCC.y"
    {
                  (yyval.lnk) = newLink (SPECIFIER);
                  SPEC_SCLS((yyval.lnk)) = S_PDATA  ;
               }
    break;

  case 147:
#line 687 "SDCC.y"
    {
                  (yyval.lnk)=newLink(SPECIFIER);
                  SPEC_NOUN((yyval.lnk)) = V_BIT   ;
                  SPEC_SCLS((yyval.lnk)) = S_BIT   ;
                  SPEC_BLEN((yyval.lnk)) = 1;
                  SPEC_BSTR((yyval.lnk)) = 0;
                  ignoreTypedefType = 1;
               }
    break;

  case 148:
#line 696 "SDCC.y"
    {
                                   uselessDecl = FALSE;
                                   (yyval.lnk) = (yyvsp[(1) - (1)].lnk) ;
                                   ignoreTypedefType = 1;
                                }
    break;

  case 149:
#line 701 "SDCC.y"
    {
                           cenum = NULL ;
                           uselessDecl = FALSE;
                           ignoreTypedefType = 1;
                           (yyval.lnk) = (yyvsp[(1) - (1)].lnk) ;
                        }
    break;

  case 150:
#line 708 "SDCC.y"
    {
            symbol *sym;
            sym_link   *p  ;
            sym = findSym(TypedefTab,NULL,(yyvsp[(1) - (1)].yychar)) ;
            (yyval.lnk) = p = copyLinkChain(sym ? sym->type : NULL);
            SPEC_TYPEDEF(getSpec(p)) = 0;
            ignoreTypedefType = 1;
         }
    break;

  case 152:
#line 720 "SDCC.y"
    {
               (yyval.lnk) = newLink(SPECIFIER) ;
               SPEC_NOUN((yyval.lnk)) = V_SBIT;
               SPEC_SCLS((yyval.lnk)) = S_SBIT;
               SPEC_BLEN((yyval.lnk)) = 1;
               SPEC_BSTR((yyval.lnk)) = 0;
               ignoreTypedefType = 1;
            }
    break;

  case 154:
#line 732 "SDCC.y"
    {
               (yyval.lnk) = newLink(SPECIFIER) ;
               FUNC_REGBANK((yyval.lnk)) = 0;
               SPEC_NOUN((yyval.lnk))    = V_CHAR;
               SPEC_SCLS((yyval.lnk))    = S_SFR ;
               SPEC_USIGN((yyval.lnk))   = 1 ;
               ignoreTypedefType = 1;
            }
    break;

  case 155:
#line 740 "SDCC.y"
    {
               (yyval.lnk) = newLink(SPECIFIER) ;
               FUNC_REGBANK((yyval.lnk)) = 1;
               SPEC_NOUN((yyval.lnk))    = V_CHAR;
               SPEC_SCLS((yyval.lnk))    = S_SFR ;
               SPEC_USIGN((yyval.lnk))   = 1 ;
               ignoreTypedefType = 1;
            }
    break;

  case 156:
#line 751 "SDCC.y"
    {
               (yyval.lnk) = newLink(SPECIFIER) ;
               FUNC_REGBANK((yyval.lnk)) = 0;
               SPEC_NOUN((yyval.lnk))    = V_INT;
               SPEC_SCLS((yyval.lnk))    = S_SFR;
               SPEC_USIGN((yyval.lnk))   = 1 ;
               ignoreTypedefType = 1;
            }
    break;

  case 157:
#line 762 "SDCC.y"
    {
               (yyval.lnk) = newLink(SPECIFIER) ;
               FUNC_REGBANK((yyval.lnk)) = 0;
               SPEC_NOUN((yyval.lnk))    = V_INT;
               SPEC_SCLS((yyval.lnk))    = S_SFR;
               SPEC_LONG((yyval.lnk))    = 1;
               SPEC_USIGN((yyval.lnk))   = 1;
               ignoreTypedefType = 1;
            }
    break;

  case 158:
#line 775 "SDCC.y"
    {
           if (!(yyvsp[(2) - (2)].sdef)->type)
             {
               (yyvsp[(2) - (2)].sdef)->type = (yyvsp[(1) - (2)].yyint);
             }
           else
             {
               if ((yyvsp[(2) - (2)].sdef)->type != (yyvsp[(1) - (2)].yyint))
                 werror(E_BAD_TAG, (yyvsp[(2) - (2)].sdef)->tag, (yyvsp[(1) - (2)].yyint)==STRUCT ? "struct" : "union");
             }

        }
    break;

  case 159:
#line 788 "SDCC.y"
    {
           structdef *sdef ;
           symbol *sym, *dsym;

           // check for errors in structure members
           for (sym=(yyvsp[(5) - (6)].sym); sym; sym=sym->next) {
             if (IS_ABSOLUTE(sym->etype)) {
               werrorfl(sym->fileDef, sym->lineDef, E_NOT_ALLOWED, "'at'");
               SPEC_ABSA(sym->etype) = 0;
             }
             if (IS_SPEC(sym->etype) && SPEC_SCLS(sym->etype)) {
               werrorfl(sym->fileDef, sym->lineDef, E_NOT_ALLOWED, "storage class");
               printTypeChainRaw (sym->type,NULL);
               SPEC_SCLS(sym->etype) = 0;
             }
             for (dsym=sym->next; dsym; dsym=dsym->next) {
               if (*dsym->name && strcmp(sym->name, dsym->name)==0) {
                 werrorfl(sym->fileDef, sym->lineDef, E_DUPLICATE_MEMBER,
                        (yyvsp[(1) - (6)].yyint)==STRUCT ? "struct" : "union", sym->name);
                 werrorfl(dsym->fileDef, dsym->lineDef, E_PREVIOUS_DEF);
               }
             }
           }

           /* Create a structdef   */
           sdef = (yyvsp[(2) - (6)].sdef) ;
           sdef->fields   = reverseSyms((yyvsp[(5) - (6)].sym)) ;   /* link the fields */
           sdef->size  = compStructSize((yyvsp[(1) - (6)].yyint),sdef);   /* update size of  */
           promoteAnonStructs ((yyvsp[(1) - (6)].yyint), sdef);

           /* Create the specifier */
           (yyval.lnk) = newLink (SPECIFIER) ;
           SPEC_NOUN((yyval.lnk)) = V_STRUCT;
           SPEC_STRUCT((yyval.lnk))= sdef ;
        }
    break;

  case 160:
#line 824 "SDCC.y"
    {
            (yyval.lnk) = newLink(SPECIFIER) ;
            SPEC_NOUN((yyval.lnk)) = V_STRUCT;
            SPEC_STRUCT((yyval.lnk)) = (yyvsp[(2) - (2)].sdef);

           if (!(yyvsp[(2) - (2)].sdef)->type)
             {
               (yyvsp[(2) - (2)].sdef)->type = (yyvsp[(1) - (2)].yyint);
             }
           else
             {
               if ((yyvsp[(2) - (2)].sdef)->type != (yyvsp[(1) - (2)].yyint))
                 werror(E_BAD_TAG, (yyvsp[(2) - (2)].sdef)->tag, (yyvsp[(1) - (2)].yyint)==STRUCT ? "struct" : "union");
             }
         }
    break;

  case 161:
#line 842 "SDCC.y"
    { (yyval.yyint) = STRUCT ; }
    break;

  case 162:
#line 843 "SDCC.y"
    { (yyval.yyint) = UNION  ; }
    break;

  case 164:
#line 848 "SDCC.y"
    {  /* synthesize a name add to structtable */
     (yyval.sdef) = newStruct(genSymName(NestLevel)) ;
     (yyval.sdef)->level = NestLevel ;
     addSym (StructTab, (yyval.sdef), (yyval.sdef)->tag,(yyval.sdef)->level,currBlockno, 0);
}
    break;

  case 165:
#line 855 "SDCC.y"
    {  /* add name to structure table */
     (yyval.sdef) = findSymWithBlock (StructTab,(yyvsp[(1) - (1)].sym),currBlockno);
     if (! (yyval.sdef) ) {
       (yyval.sdef) = newStruct((yyvsp[(1) - (1)].sym)->name) ;
       (yyval.sdef)->level = NestLevel ;
       addSym (StructTab, (yyval.sdef), (yyval.sdef)->tag,(yyval.sdef)->level,currBlockno,0);
     }
}
    break;

  case 167:
#line 868 "SDCC.y"
    {
           symbol *sym=(yyvsp[(2) - (2)].sym);

           /* go to the end of the chain */
           while (sym->next) sym=sym->next;
           sym->next = (yyvsp[(1) - (2)].sym) ;

           (yyval.sym) = (yyvsp[(2) - (2)].sym);
       }
    break;

  case 168:
#line 881 "SDCC.y"
    {
           /* add this type to all the symbols */
           symbol *sym ;
           for ( sym = (yyvsp[(2) - (3)].sym) ; sym != NULL ; sym = sym->next ) {
               sym_link *btype = copyLinkChain((yyvsp[(1) - (3)].lnk));
               if (options.unsigned_char && SPEC_NOUN(btype) == V_CHAR && !(btype)->select.s.b_signed)
                 SPEC_USIGN(btype) = 1;

               /* make the symbol one level up */
               sym->level-- ;

               pointerTypes(sym->type,btype);
               if (!sym->type) {
                   sym->type = btype;
                   sym->etype = getSpec(sym->type);
               }
               else
                 addDecl (sym,0,btype);
               /* make sure the type is complete and sane */
               checkTypeSanity(sym->etype, sym->name);
           }
           ignoreTypedefType = 0;
           (yyval.sym) = (yyvsp[(2) - (3)].sym);
       }
    break;

  case 170:
#line 910 "SDCC.y"
    {
           (yyvsp[(3) - (3)].sym)->next  = (yyvsp[(1) - (3)].sym) ;
           (yyval.sym) = (yyvsp[(3) - (3)].sym) ;
       }
    break;

  case 172:
#line 918 "SDCC.y"
    {
                           unsigned int bitsize;
                           (yyval.sym) = newSymbol (genSymName(NestLevel),NestLevel) ;
                           bitsize = (unsigned int) ulFromVal(constExprValue((yyvsp[(2) - (2)].asts),TRUE));
                           if (bitsize > (port->s.int_size * 8)) {
                             bitsize = port->s.int_size * 8;
                             werror(E_BITFLD_SIZE, bitsize);
                           }
                           if (!bitsize)
                             bitsize = BITVAR_PAD;
                           (yyval.sym)->bitVar = bitsize;
                           (yyval.sym)->bitUnnamed = 1;
                        }
    break;

  case 173:
#line 932 "SDCC.y"
    {
                          unsigned int bitsize;
                          bitsize = (unsigned int) ulFromVal(constExprValue((yyvsp[(3) - (3)].asts),TRUE));
                          if (bitsize > (port->s.int_size * 8)) {
                            bitsize = port->s.int_size * 8;
                            werror(E_BITFLD_SIZE, bitsize);
                          }
                          if (!bitsize) {
                            (yyval.sym) = newSymbol (genSymName(NestLevel),NestLevel) ;
                            (yyval.sym)->bitVar = BITVAR_PAD;
                            werror(W_BITFLD_NAMED);
                          }
                          else
                            (yyvsp[(1) - (3)].sym)->bitVar = bitsize;
                        }
    break;

  case 174:
#line 947 "SDCC.y"
    { (yyval.sym) = newSymbol ("", NestLevel) ; }
    break;

  case 175:
#line 952 "SDCC.y"
    {
           (yyval.lnk) = newEnumType ((yyvsp[(3) - (4)].sym));       //copyLinkChain(cenum->type);
           SPEC_SCLS(getSpec((yyval.lnk))) = 0;
         }
    break;

  case 176:
#line 957 "SDCC.y"
    {
     symbol *csym ;
     sym_link *enumtype;

     csym=findSym(enumTab,(yyvsp[(2) - (5)].sym),(yyvsp[(2) - (5)].sym)->name);
     if ((csym && csym->level == (yyvsp[(2) - (5)].sym)->level))
       {
         werrorfl((yyvsp[(2) - (5)].sym)->fileDef, (yyvsp[(2) - (5)].sym)->lineDef, E_DUPLICATE_TYPEDEF,csym->name);
         werrorfl(csym->fileDef, csym->lineDef, E_PREVIOUS_DEF);
       }

     enumtype = newEnumType ((yyvsp[(4) - (5)].sym));       //copyLinkChain(cenum->type);
     SPEC_SCLS(getSpec(enumtype)) = 0;
     (yyvsp[(2) - (5)].sym)->type = enumtype;

     /* add this to the enumerator table */
     if (!csym)
       addSym ( enumTab,(yyvsp[(2) - (5)].sym),(yyvsp[(2) - (5)].sym)->name,(yyvsp[(2) - (5)].sym)->level,(yyvsp[(2) - (5)].sym)->block, 0);
     (yyval.lnk) = copyLinkChain(enumtype);
   }
    break;

  case 177:
#line 977 "SDCC.y"
    {
     symbol *csym ;

     /* check the enumerator table */
     if ((csym = findSym(enumTab,(yyvsp[(2) - (2)].sym),(yyvsp[(2) - (2)].sym)->name)))
       (yyval.lnk) = copyLinkChain(csym->type);
     else  {
       (yyval.lnk) = newLink(SPECIFIER) ;
       SPEC_NOUN((yyval.lnk)) = V_INT   ;
     }
   }
    break;

  case 180:
#line 994 "SDCC.y"
    {
        (yyvsp[(3) - (3)].sym)->next = (yyvsp[(1) - (3)].sym) ;
        (yyval.sym) = (yyvsp[(3) - (3)].sym)  ;
      }
    break;

  case 181:
#line 1002 "SDCC.y"
    {
        symbol *sym;

        /* make the symbol one level up */
        (yyvsp[(1) - (2)].sym)->level-- ;
        // check if the symbol at the same level already exists
        if ((sym = findSymWithLevel (SymbolTab, (yyvsp[(1) - (2)].sym))) &&
          sym->level == (yyvsp[(1) - (2)].sym)->level)
          {
            werrorfl ((yyvsp[(1) - (2)].sym)->fileDef, (yyvsp[(1) - (2)].sym)->lineDef, E_DUPLICATE_MEMBER, "enum", (yyvsp[(1) - (2)].sym)->name);
            werrorfl (sym->fileDef, sym->lineDef, E_PREVIOUS_DEF);
          }
        (yyvsp[(1) - (2)].sym)->type = copyLinkChain ((yyvsp[(2) - (2)].val)->type);
        (yyvsp[(1) - (2)].sym)->etype= getSpec ((yyvsp[(1) - (2)].sym)->type);
        SPEC_ENUM ((yyvsp[(1) - (2)].sym)->etype) = 1;
        (yyval.sym) = (yyvsp[(1) - (2)].sym) ;
        // do this now, so we can use it for the next enums in the list
        addSymChain (&(yyvsp[(1) - (2)].sym));
      }
    break;

  case 182:
#line 1024 "SDCC.y"
    {
                              value *val ;

                              val = constExprValue((yyvsp[(2) - (2)].asts),TRUE);
                              if (!IS_INT(val->type) && !IS_CHAR(val->type))
                                {
                                  werror(E_ENUM_NON_INTEGER);
                                  SNPRINTF(lbuff, sizeof(lbuff),
                                          "%d", (int) ulFromVal(val));
                                  val = constVal(lbuff);
                                }
                              (yyval.val) = cenum = val ;
                           }
    break;

  case 183:
#line 1037 "SDCC.y"
    {
                              if (cenum)  {
                                 SNPRINTF(lbuff, sizeof(lbuff),
                                          "%d", (int) ulFromVal(cenum)+1);
                                 (yyval.val) = cenum = constVal(lbuff);
                              }
                              else {
                                 (yyval.val) = cenum = constCharVal(0);
                              }
                           }
    break;

  case 184:
#line 1050 "SDCC.y"
    { (yyval.sym) = (yyvsp[(1) - (1)].sym) ; }
    break;

  case 185:
#line 1052 "SDCC.y"
    {
             addDecl ((yyvsp[(2) - (2)].sym),0,reverseLink((yyvsp[(1) - (2)].lnk)));
             (yyval.sym) = (yyvsp[(2) - (2)].sym) ;
         }
    break;

  case 186:
#line 1059 "SDCC.y"
    { (yyval.sym) = (yyvsp[(1) - (1)].sym) ; }
    break;

  case 187:
#line 1060 "SDCC.y"
    { (yyval.sym) = (yyvsp[(1) - (1)].sym) ; }
    break;

  case 188:
#line 1064 "SDCC.y"
    { (yyval.sym) = (yyvsp[(1) - (1)].sym); }
    break;

  case 189:
#line 1066 "SDCC.y"
    {
             addDecl ((yyvsp[(2) - (2)].sym),0,reverseLink((yyvsp[(1) - (2)].lnk)));
             (yyval.sym) = (yyvsp[(2) - (2)].sym) ;
         }
    break;

  case 190:
#line 1073 "SDCC.y"
    { (yyval.sym) = (yyvsp[(1) - (1)].sym) ; }
    break;

  case 191:
#line 1074 "SDCC.y"
    {
           // copy the functionAttributes (not the args and hasVargs !!)
           struct value *args;
           unsigned hasVargs;
           sym_link *funcType=(yyvsp[(1) - (2)].sym)->type;

           while (funcType && !IS_FUNC(funcType))
             funcType = funcType->next;

           if (!funcType)
             werror (E_FUNC_ATTR);
           else
             {
               args=FUNC_ARGS(funcType);
               hasVargs=FUNC_HASVARARGS(funcType);

               memcpy (&funcType->funcAttrs, &(yyvsp[(2) - (2)].lnk)->funcAttrs,
                   sizeof((yyvsp[(2) - (2)].lnk)->funcAttrs));

               FUNC_ARGS(funcType)=args;
               FUNC_HASVARARGS(funcType)=hasVargs;

               // just to be sure
               memset (&(yyvsp[(2) - (2)].lnk)->funcAttrs, 0,
                   sizeof((yyvsp[(2) - (2)].lnk)->funcAttrs));

               addDecl ((yyvsp[(1) - (2)].sym),0,(yyvsp[(2) - (2)].lnk));
             }
   }
    break;

  case 193:
#line 1107 "SDCC.y"
    { (yyval.sym) = (yyvsp[(2) - (3)].sym); }
    break;

  case 194:
#line 1109 "SDCC.y"
    {
            sym_link   *p;

            p = newLink (DECLARATOR);
            DCL_TYPE(p) = ARRAY ;
            DCL_ELEM(p) = 0     ;
            addDecl((yyvsp[(1) - (3)].sym),0,p);
         }
    break;

  case 195:
#line 1118 "SDCC.y"
    {
            sym_link *p;
            value *tval;
            int size;

            tval = constExprValue((yyvsp[(3) - (4)].asts), TRUE);
            /* if it is not a constant then Error  */
            p = newLink (DECLARATOR);
            DCL_TYPE(p) = ARRAY;

            if (!tval || (SPEC_SCLS(tval->etype) != S_LITERAL))
              {
                werror(E_CONST_EXPECTED);
                /* Assume a single item array to limit the cascade */
                /* of additional errors. */
                size = 1;
              }
            else
              {
                if ((size = (int) ulFromVal(tval)) < 0)
                  {
                    werror(E_NEGATIVE_ARRAY_SIZE, (yyvsp[(1) - (4)].sym)->name);
                    size = 1;
                  }
              }
            DCL_ELEM(p) = size;
            addDecl((yyvsp[(1) - (4)].sym), 0, p);
         }
    break;

  case 196:
#line 1149 "SDCC.y"
    {  addDecl ((yyvsp[(1) - (3)].sym),FUNCTION,NULL) ;   }
    break;

  case 197:
#line 1150 "SDCC.y"
    { NestLevel++ ; currBlockno++;  }
    break;

  case 198:
#line 1152 "SDCC.y"
    {
             sym_link *funcType;

             addDecl ((yyvsp[(1) - (5)].sym),FUNCTION,NULL) ;

             funcType = (yyvsp[(1) - (5)].sym)->type;
             while (funcType && !IS_FUNC(funcType))
               funcType = funcType->next;

             assert (funcType);

             FUNC_HASVARARGS(funcType) = IS_VARG((yyvsp[(4) - (5)].val));
             FUNC_ARGS(funcType) = reverseVal((yyvsp[(4) - (5)].val));

             /* nest level was incremented to take care of the parms  */
             NestLevel-- ;
             currBlockno--;

             // if this was a pointer (to a function)
             if (!IS_FUNC((yyvsp[(1) - (5)].sym)->type))
               cleanUpLevel(SymbolTab,NestLevel+1);

             (yyval.sym) = (yyvsp[(1) - (5)].sym);
         }
    break;

  case 199:
#line 1177 "SDCC.y"
    {
           werror(E_OLD_STYLE,(yyvsp[(1) - (4)].sym)->name) ;
           /* assume it returns an int */
           (yyvsp[(1) - (4)].sym)->type = (yyvsp[(1) - (4)].sym)->etype = newIntLink();
           (yyval.sym) = (yyvsp[(1) - (4)].sym) ;
         }
    break;

  case 200:
#line 1186 "SDCC.y"
    { (yyval.lnk) = (yyvsp[(1) - (1)].lnk) ;}
    break;

  case 201:
#line 1188 "SDCC.y"
    {
             (yyval.lnk) = (yyvsp[(1) - (2)].lnk)  ;
             if (IS_SPEC((yyvsp[(2) - (2)].lnk))) {
                 DCL_TSPEC((yyvsp[(1) - (2)].lnk)) = (yyvsp[(2) - (2)].lnk);
                 DCL_PTR_CONST((yyvsp[(1) - (2)].lnk)) = SPEC_CONST((yyvsp[(2) - (2)].lnk));
                 DCL_PTR_VOLATILE((yyvsp[(1) - (2)].lnk)) = SPEC_VOLATILE((yyvsp[(2) - (2)].lnk));
                 DCL_PTR_RESTRICT((yyvsp[(1) - (2)].lnk)) = SPEC_RESTRICT((yyvsp[(2) - (2)].lnk));
             }
             else
                 werror (W_PTR_TYPE_INVALID);
         }
    break;

  case 202:
#line 1200 "SDCC.y"
    {
             (yyval.lnk) = (yyvsp[(1) - (2)].lnk) ;
             (yyval.lnk)->next = (yyvsp[(2) - (2)].lnk) ;
             DCL_TYPE((yyvsp[(2) - (2)].lnk))=port->unqualified_pointer;
         }
    break;

  case 203:
#line 1206 "SDCC.y"
    {
             (yyval.lnk) = (yyvsp[(1) - (3)].lnk) ;
             if (IS_SPEC((yyvsp[(2) - (3)].lnk)) && DCL_TYPE((yyvsp[(3) - (3)].lnk)) == UPOINTER) {
                 DCL_PTR_CONST((yyvsp[(1) - (3)].lnk)) = SPEC_CONST((yyvsp[(2) - (3)].lnk));
                 DCL_PTR_VOLATILE((yyvsp[(1) - (3)].lnk)) = SPEC_VOLATILE((yyvsp[(2) - (3)].lnk));
                 DCL_PTR_RESTRICT((yyvsp[(1) - (3)].lnk)) = SPEC_RESTRICT((yyvsp[(2) - (3)].lnk));
                 switch (SPEC_SCLS((yyvsp[(2) - (3)].lnk))) {
                 case S_XDATA:
                     DCL_TYPE((yyvsp[(3) - (3)].lnk)) = FPOINTER;
                     break;
                 case S_IDATA:
                     DCL_TYPE((yyvsp[(3) - (3)].lnk)) = IPOINTER ;
                     break;
                 case S_PDATA:
                     DCL_TYPE((yyvsp[(3) - (3)].lnk)) = PPOINTER ;
                     break;
                 case S_DATA:
                     DCL_TYPE((yyvsp[(3) - (3)].lnk)) = POINTER ;
                     break;
                 case S_CODE:
                     DCL_TYPE((yyvsp[(3) - (3)].lnk)) = CPOINTER ;
                     break;
                 case S_EEPROM:
                     DCL_TYPE((yyvsp[(3) - (3)].lnk)) = EEPPOINTER;
                     break;
                 default:
                   // this could be just "constant"
                   // werror(W_PTR_TYPE_INVALID);
                     ;
                 }
             }
             else
                 werror (W_PTR_TYPE_INVALID);
             (yyval.lnk)->next = (yyvsp[(3) - (3)].lnk) ;
         }
    break;

  case 204:
#line 1245 "SDCC.y"
    {
        (yyval.lnk) = newLink(DECLARATOR);
        DCL_TYPE((yyval.lnk))=UPOINTER;
      }
    break;

  case 206:
#line 1254 "SDCC.y"
    {
     /* if the decl $2 is not a specifier */
     /* find the spec and replace it      */
     if ( !IS_SPEC((yyvsp[(2) - (2)].lnk))) {
       sym_link *lnk = (yyvsp[(2) - (2)].lnk) ;
       while (lnk && !IS_SPEC(lnk->next))
         lnk = lnk->next;
       lnk->next = mergeSpec((yyvsp[(1) - (2)].lnk),lnk->next, "type_specifier_list type_specifier skipped");
       (yyval.lnk) = (yyvsp[(2) - (2)].lnk) ;
     }
     else
       (yyval.lnk) = mergeSpec((yyvsp[(1) - (2)].lnk),(yyvsp[(2) - (2)].lnk), "type_specifier_list type_specifier");
   }
    break;

  case 208:
#line 1272 "SDCC.y"
    {
           (yyvsp[(3) - (3)].sym)->next = (yyvsp[(1) - (3)].sym);
           (yyval.sym) = (yyvsp[(3) - (3)].sym) ;
         }
    break;

  case 210:
#line 1280 "SDCC.y"
    { (yyvsp[(1) - (3)].val)->vArgs = 1;}
    break;

  case 212:
#line 1286 "SDCC.y"
    {
            (yyvsp[(3) - (3)].val)->next = (yyvsp[(1) - (3)].val) ;
            (yyval.val) = (yyvsp[(3) - (3)].val) ;
         }
    break;

  case 213:
#line 1294 "SDCC.y"
    {
                  symbol *loop ;
                  pointerTypes((yyvsp[(2) - (2)].sym)->type,(yyvsp[(1) - (2)].lnk));
                  if (options.unsigned_char && SPEC_NOUN((yyvsp[(1) - (2)].lnk)) == V_CHAR && !((yyvsp[(1) - (2)].lnk))->select.s.b_signed)
                    SPEC_USIGN((yyvsp[(1) - (2)].lnk)) = 1;
                  addDecl ((yyvsp[(2) - (2)].sym),0,(yyvsp[(1) - (2)].lnk));
                  for (loop=(yyvsp[(2) - (2)].sym);loop;loop->_isparm=1,loop=loop->next);
                  addSymChain (&(yyvsp[(2) - (2)].sym));
                  (yyval.val) = symbolVal((yyvsp[(2) - (2)].sym));
                  ignoreTypedefType = 0;
               }
    break;

  case 214:
#line 1305 "SDCC.y"
    {
                  (yyval.val) = newValue() ;
                  if (options.unsigned_char && SPEC_NOUN((yyvsp[(1) - (1)].lnk)) == V_CHAR && !((yyvsp[(1) - (1)].lnk))->select.s.b_signed)
                    SPEC_USIGN((yyvsp[(1) - (1)].lnk)) = 1;
                  (yyval.val)->type = (yyvsp[(1) - (1)].lnk);
                  (yyval.val)->etype = getSpec((yyval.val)->type);
                  ignoreTypedefType = 0;
               }
    break;

  case 215:
#line 1316 "SDCC.y"
    { (yyval.lnk) = (yyvsp[(1) - (1)].lnk); ignoreTypedefType = 0;}
    break;

  case 216:
#line 1318 "SDCC.y"
    {
                 /* go to the end of the list */
                 sym_link *p;
                 pointerTypes((yyvsp[(2) - (2)].lnk),(yyvsp[(1) - (2)].lnk));
                 for ( p = (yyvsp[(2) - (2)].lnk) ; p && p->next ; p=p->next);
                 if (!p) {
                   werror(E_SYNTAX_ERROR, yytext);
                 } else {
                   p->next = (yyvsp[(1) - (2)].lnk) ;
                 }
                 (yyval.lnk) = (yyvsp[(2) - (2)].lnk) ;
                 ignoreTypedefType = 0;
               }
    break;

  case 217:
#line 1334 "SDCC.y"
    { (yyval.lnk) = reverseLink((yyvsp[(1) - (1)].lnk)); }
    break;

  case 219:
#line 1336 "SDCC.y"
    { (yyvsp[(1) - (2)].lnk) = reverseLink((yyvsp[(1) - (2)].lnk)); (yyvsp[(1) - (2)].lnk)->next = (yyvsp[(2) - (2)].lnk) ; (yyval.lnk) = (yyvsp[(1) - (2)].lnk);
          if (IS_PTR((yyvsp[(1) - (2)].lnk)) && IS_FUNC((yyvsp[(2) - (2)].lnk)))
            DCL_TYPE((yyvsp[(1) - (2)].lnk)) = CPOINTER;
        }
    break;

  case 220:
#line 1343 "SDCC.y"
    { (yyval.lnk) = (yyvsp[(2) - (3)].lnk) ; }
    break;

  case 221:
#line 1344 "SDCC.y"
    {
                                       (yyval.lnk) = newLink (DECLARATOR);
                                       DCL_TYPE((yyval.lnk)) = ARRAY ;
                                       DCL_ELEM((yyval.lnk)) = 0     ;
                                    }
    break;

  case 222:
#line 1349 "SDCC.y"
    {
                                       value *val ;
                                       (yyval.lnk) = newLink (DECLARATOR);
                                       DCL_TYPE((yyval.lnk)) = ARRAY ;
                                       DCL_ELEM((yyval.lnk)) = (int) ulFromVal(val = constExprValue((yyvsp[(2) - (3)].asts),TRUE));
                                    }
    break;

  case 223:
#line 1355 "SDCC.y"
    {
                                       (yyval.lnk) = newLink (DECLARATOR);
                                       DCL_TYPE((yyval.lnk)) = ARRAY ;
                                       DCL_ELEM((yyval.lnk)) = 0     ;
                                       (yyval.lnk)->next = (yyvsp[(1) - (3)].lnk) ;
                                    }
    break;

  case 224:
#line 1362 "SDCC.y"
    {
                                       value *val ;
                                       (yyval.lnk) = newLink (DECLARATOR);
                                       DCL_TYPE((yyval.lnk)) = ARRAY ;
                                       DCL_ELEM((yyval.lnk)) = (int) ulFromVal(val = constExprValue((yyvsp[(3) - (4)].asts),TRUE));
                                       (yyval.lnk)->next = (yyvsp[(1) - (4)].lnk) ;
                                    }
    break;

  case 225:
#line 1369 "SDCC.y"
    { (yyval.lnk) = NULL;}
    break;

  case 226:
#line 1370 "SDCC.y"
    { (yyval.lnk) = NULL;}
    break;

  case 227:
#line 1371 "SDCC.y"
    {
     // $1 must be a pointer to a function
     sym_link *p=newLink(DECLARATOR);
     DCL_TYPE(p) = FUNCTION;
     if (!(yyvsp[(1) - (3)].lnk)) {
       // ((void (code *) ()) 0) ()
       (yyvsp[(1) - (3)].lnk)=newLink(DECLARATOR);
       DCL_TYPE((yyvsp[(1) - (3)].lnk))=CPOINTER;
       (yyval.lnk) = (yyvsp[(1) - (3)].lnk);
     }
     (yyvsp[(1) - (3)].lnk)->next=p;
   }
    break;

  case 228:
#line 1383 "SDCC.y"
    { NestLevel++ ; currBlockno++; }
    break;

  case 229:
#line 1383 "SDCC.y"
    {
       sym_link *p=newLink(DECLARATOR);
       DCL_TYPE(p) = FUNCTION;

       FUNC_HASVARARGS(p) = IS_VARG((yyvsp[(4) - (5)].val));
       FUNC_ARGS(p) = reverseVal((yyvsp[(4) - (5)].val));

       /* nest level was incremented to take care of the parms  */
       NestLevel-- ;
       currBlockno--;
       if (!(yyvsp[(1) - (5)].lnk)) {
         /* ((void (code *) (void)) 0) () */
         (yyvsp[(1) - (5)].lnk)=newLink(DECLARATOR);
         DCL_TYPE((yyvsp[(1) - (5)].lnk))=CPOINTER;
         (yyval.lnk) = (yyvsp[(1) - (5)].lnk);
       }
       (yyvsp[(1) - (5)].lnk)->next=p;

       // remove the symbol args (if any)
       cleanUpLevel(SymbolTab,NestLevel+1);
   }
    break;

  case 230:
#line 1407 "SDCC.y"
    { (yyval.ilist) = newiList(INIT_NODE,(yyvsp[(1) - (1)].asts)); }
    break;

  case 231:
#line 1408 "SDCC.y"
    { (yyval.ilist) = newiList(INIT_DEEP,revinit((yyvsp[(2) - (3)].ilist))); }
    break;

  case 232:
#line 1409 "SDCC.y"
    { (yyval.ilist) = newiList(INIT_DEEP,revinit((yyvsp[(2) - (4)].ilist))); }
    break;

  case 234:
#line 1414 "SDCC.y"
    {  (yyvsp[(3) - (3)].ilist)->next = (yyvsp[(1) - (3)].ilist); (yyval.ilist) = (yyvsp[(3) - (3)].ilist); }
    break;

  case 242:
#line 1425 "SDCC.y"
    {
                            ast *ex;
                            seqPointNo++;
                            ex = newNode(INLINEASM,NULL,NULL);
                            ex->values.inlineasm = strdup((yyvsp[(1) - (2)].yyinline));
                            seqPointNo++;
                            (yyval.asts) = ex;
                         }
    break;

  case 243:
#line 1436 "SDCC.y"
    {
                   inCritical++;
                   STACK_PUSH(continueStack,NULL);
                   STACK_PUSH(breakStack,NULL);
                   (yyval.sym) = NULL;
                }
    break;

  case 244:
#line 1445 "SDCC.y"
    {
                   STACK_POP(breakStack);
                   STACK_POP(continueStack);
                   inCritical--;
                   (yyval.asts) = newNode(CRITICAL,(yyvsp[(2) - (2)].asts),NULL);
                }
    break;

  case 245:
#line 1455 "SDCC.y"
    {  (yyval.asts) = createLabel((yyvsp[(1) - (2)].sym),NULL);
                                          (yyvsp[(1) - (2)].sym)->isitmp = 0;  }
    break;

  case 246:
#line 1458 "SDCC.y"
    {
       if (STACK_EMPTY(swStk))
         (yyval.asts) = createCase(NULL,(yyvsp[(2) - (3)].asts),NULL);
       else
         (yyval.asts) = createCase(STACK_PEEK(swStk),(yyvsp[(2) - (3)].asts),NULL);
     }
    break;

  case 247:
#line 1464 "SDCC.y"
    { (yyval.asts) = newNode(DEFAULT,NULL,NULL); }
    break;

  case 248:
#line 1465 "SDCC.y"
    {
       if (STACK_EMPTY(swStk))
         (yyval.asts) = createDefault(NULL,(yyvsp[(2) - (3)].asts),NULL);
       else
         (yyval.asts) = createDefault(STACK_PEEK(swStk),(yyvsp[(2) - (3)].asts),NULL);
     }
    break;

  case 249:
#line 1474 "SDCC.y"
    {
                STACK_PUSH(blockNum,currBlockno);
                currBlockno = ++blockNo ;
                ignoreTypedefType = 0;
              }
    break;

  case 250:
#line 1481 "SDCC.y"
    { currBlockno = STACK_POP(blockNum); }
    break;

  case 251:
#line 1485 "SDCC.y"
    { (yyval.asts) = createBlock(NULL, NULL); }
    break;

  case 252:
#line 1486 "SDCC.y"
    { (yyval.asts) = createBlock(NULL, (yyvsp[(2) - (3)].asts)); }
    break;

  case 253:
#line 1487 "SDCC.y"
    { (yyval.asts) = createBlock((yyvsp[(2) - (3)].sym), NULL); }
    break;

  case 254:
#line 1490 "SDCC.y"
    {(yyval.asts) = createBlock((yyvsp[(2) - (4)].sym), (yyvsp[(3) - (4)].asts)); }
    break;

  case 255:
#line 1491 "SDCC.y"
    { (yyval.asts) = NULL ; }
    break;

  case 256:
#line 1496 "SDCC.y"
    {
       /* if this is typedef declare it immediately */
       if ( (yyvsp[(1) - (1)].sym) && IS_TYPEDEF((yyvsp[(1) - (1)].sym)->etype)) {
         allocVariables ((yyvsp[(1) - (1)].sym));
         (yyval.sym) = NULL ;
       }
       else
         (yyval.sym) = (yyvsp[(1) - (1)].sym) ;
       ignoreTypedefType = 0;
       addSymChain(&(yyvsp[(1) - (1)].sym));
     }
    break;

  case 257:
#line 1509 "SDCC.y"
    {
       symbol   *sym;

       /* if this is a typedef */
       if ((yyvsp[(2) - (2)].sym) && IS_TYPEDEF((yyvsp[(2) - (2)].sym)->etype)) {
         allocVariables ((yyvsp[(2) - (2)].sym));
         (yyval.sym) = (yyvsp[(1) - (2)].sym) ;
       }
       else {
                                /* get to the end of the previous decl */
         if ( (yyvsp[(1) - (2)].sym) ) {
           (yyval.sym) = sym = (yyvsp[(1) - (2)].sym) ;
           while (sym->next)
             sym = sym->next ;
           sym->next = (yyvsp[(2) - (2)].sym);
         }
         else
           (yyval.sym) = (yyvsp[(2) - (2)].sym) ;
       }
       ignoreTypedefType = 0;
       addSymChain(&(yyvsp[(2) - (2)].sym));
     }
    break;

  case 259:
#line 1535 "SDCC.y"
    {  (yyval.asts) = newNode(NULLOP,(yyvsp[(1) - (2)].asts),(yyvsp[(2) - (2)].asts)) ;}
    break;

  case 260:
#line 1539 "SDCC.y"
    { (yyval.asts) = NULL;}
    break;

  case 261:
#line 1540 "SDCC.y"
    { (yyval.asts) = (yyvsp[(1) - (2)].asts); seqPointNo++;}
    break;

  case 262:
#line 1544 "SDCC.y"
    { (yyval.asts) = (yyvsp[(2) - (2)].asts)  ; }
    break;

  case 263:
#line 1545 "SDCC.y"
    { (yyval.asts) = NULL;}
    break;

  case 264:
#line 1550 "SDCC.y"
    { seqPointNo++;}
    break;

  case 265:
#line 1551 "SDCC.y"
    {
                              noLineno++ ;
                              (yyval.asts) = createIf ((yyvsp[(3) - (7)].asts), (yyvsp[(6) - (7)].asts), (yyvsp[(7) - (7)].asts) );
                              (yyval.asts)->lineno = (yyvsp[(3) - (7)].asts)->lineno;
                              (yyval.asts)->filename = (yyvsp[(3) - (7)].asts)->filename;
                              noLineno--;
                           }
    break;

  case 266:
#line 1558 "SDCC.y"
    {
                              ast *ex ;
                              static   int swLabel = 0 ;

                              seqPointNo++;
                              /* create a node for expression  */
                              ex = newNode(SWITCH,(yyvsp[(3) - (4)].asts),NULL);
                              STACK_PUSH(swStk,ex);   /* save it in the stack */
                              ex->values.switchVals.swNum = swLabel ;

                              /* now create the label */
                              SNPRINTF(lbuff, sizeof(lbuff),
                                       "_swBrk_%d",swLabel++);
                              (yyval.sym)  =  newSymbol(lbuff,NestLevel);
                              /* put label in the break stack  */
                              STACK_PUSH(breakStack,(yyval.sym));
                           }
    break;

  case 267:
#line 1575 "SDCC.y"
    {
                              /* get back the switch form the stack  */
                              (yyval.asts) = STACK_POP(swStk)  ;
                              (yyval.asts)->right = newNode (NULLOP,(yyvsp[(6) - (6)].asts),createLabel((yyvsp[(5) - (6)].sym),NULL));
                              STACK_POP(breakStack);
                           }
    break;

  case 268:
#line 1583 "SDCC.y"
    {  /* create and push the continue , break & body labels */
                  static int Lblnum = 0 ;
                  /* continue */
                  SNPRINTF (lbuff, sizeof(lbuff), "_whilecontinue_%d",Lblnum);
                  STACK_PUSH(continueStack,newSymbol(lbuff,NestLevel));
                  /* break */
                  SNPRINTF (lbuff, sizeof(lbuff), "_whilebreak_%d",Lblnum);
                  STACK_PUSH(breakStack,newSymbol(lbuff,NestLevel));
                  /* body */
                  SNPRINTF (lbuff, sizeof(lbuff), "_whilebody_%d",Lblnum++);
                  (yyval.sym) = newSymbol(lbuff,NestLevel);
               }
    break;

  case 269:
#line 1597 "SDCC.y"
    {  /* create and push the continue , break & body Labels */
           static int Lblnum = 0 ;

           /* continue */
           SNPRINTF(lbuff, sizeof(lbuff), "_docontinue_%d",Lblnum);
           STACK_PUSH(continueStack,newSymbol(lbuff,NestLevel));
           /* break */
           SNPRINTF(lbuff, sizeof(lbuff), "_dobreak_%d",Lblnum);
           STACK_PUSH(breakStack,newSymbol(lbuff,NestLevel));
           /* do body */
           SNPRINTF(lbuff, sizeof(lbuff), "_dobody_%d",Lblnum++);
           (yyval.sym) = newSymbol (lbuff,NestLevel);
        }
    break;

  case 270:
#line 1612 "SDCC.y"
    { /* create & push continue, break & body labels */
            static int Lblnum = 0 ;

            /* continue */
            SNPRINTF(lbuff, sizeof(lbuff), "_forcontinue_%d",Lblnum);
            STACK_PUSH(continueStack,newSymbol(lbuff,NestLevel));
            /* break    */
            SNPRINTF(lbuff, sizeof(lbuff), "_forbreak_%d",Lblnum);
            STACK_PUSH(breakStack,newSymbol(lbuff,NestLevel));
            /* body */
            SNPRINTF(lbuff, sizeof(lbuff), "_forbody_%d",Lblnum);
            (yyval.sym) = newSymbol(lbuff,NestLevel);
            /* condition */
            SNPRINTF(lbuff, sizeof(lbuff), "_forcond_%d",Lblnum++);
            STACK_PUSH(forStack,newSymbol(lbuff,NestLevel));
          }
    break;

  case 271:
#line 1631 "SDCC.y"
    { seqPointNo++;}
    break;

  case 272:
#line 1632 "SDCC.y"
    {
                           noLineno++ ;
                           (yyval.asts) = createWhile ( (yyvsp[(1) - (6)].sym), STACK_POP(continueStack),
                                              STACK_POP(breakStack), (yyvsp[(3) - (6)].asts), (yyvsp[(6) - (6)].asts) );
                           (yyval.asts)->lineno = (yyvsp[(1) - (6)].sym)->lineDef;
                           (yyval.asts)->filename = (yyvsp[(1) - (6)].sym)->fileDef;
                           noLineno-- ;
                         }
    break;

  case 273:
#line 1641 "SDCC.y"
    {
                          seqPointNo++;
                          noLineno++ ;
                          (yyval.asts) = createDo ( (yyvsp[(1) - (7)].sym) , STACK_POP(continueStack),
                                          STACK_POP(breakStack), (yyvsp[(5) - (7)].asts), (yyvsp[(2) - (7)].asts));
                          (yyval.asts)->lineno = (yyvsp[(1) - (7)].sym)->lineDef;
                          (yyval.asts)->filename = (yyvsp[(1) - (7)].sym)->fileDef;
                          noLineno-- ;
                        }
    break;

  case 274:
#line 1651 "SDCC.y"
    {
                          noLineno++ ;

                          /* if break or continue statement present
                             then create a general case loop */
                          if (STACK_PEEK(continueStack)->isref ||
                              STACK_PEEK(breakStack)->isref) {
                              (yyval.asts) = createFor ((yyvsp[(1) - (9)].sym), STACK_POP(continueStack),
                                              STACK_POP(breakStack) ,
                                              STACK_POP(forStack)   ,
                                              (yyvsp[(3) - (9)].asts) , (yyvsp[(5) - (9)].asts) , (yyvsp[(7) - (9)].asts), (yyvsp[(9) - (9)].asts) );
                          } else {
                              (yyval.asts) = newNode(FOR,(yyvsp[(9) - (9)].asts),NULL);
                              AST_FOR((yyval.asts),trueLabel) = (yyvsp[(1) - (9)].sym);
                              AST_FOR((yyval.asts),continueLabel) =  STACK_POP(continueStack);
                              AST_FOR((yyval.asts),falseLabel) = STACK_POP(breakStack);
                              AST_FOR((yyval.asts),condLabel)  = STACK_POP(forStack)  ;
                              AST_FOR((yyval.asts),initExpr)   = (yyvsp[(3) - (9)].asts);
                              AST_FOR((yyval.asts),condExpr)   = (yyvsp[(5) - (9)].asts);
                              AST_FOR((yyval.asts),loopExpr)   = (yyvsp[(7) - (9)].asts);
                          }

                          noLineno-- ;
                        }
    break;

  case 275:
#line 1678 "SDCC.y"
    { (yyval.asts) = NULL ; seqPointNo++; }
    break;

  case 276:
#line 1679 "SDCC.y"
    { (yyval.asts) = (yyvsp[(1) - (1)].asts) ; seqPointNo++; }
    break;

  case 277:
#line 1683 "SDCC.y"
    {
                              (yyvsp[(2) - (3)].sym)->islbl = 1;
                              (yyval.asts) = newAst_VALUE(symbolVal((yyvsp[(2) - (3)].sym)));
                              (yyval.asts) = newNode(GOTO,(yyval.asts),NULL);
                           }
    break;

  case 278:
#line 1688 "SDCC.y"
    {
       /* make sure continue is in context */
       if (STACK_EMPTY(continueStack) || STACK_PEEK(continueStack) == NULL) {
           werror(E_BREAK_CONTEXT);
           (yyval.asts) = NULL;
       }
       else {
           (yyval.asts) = newAst_VALUE(symbolVal(STACK_PEEK(continueStack)));
           (yyval.asts) = newNode(GOTO,(yyval.asts),NULL);
           /* mark the continue label as referenced */
           STACK_PEEK(continueStack)->isref = 1;
       }
   }
    break;

  case 279:
#line 1701 "SDCC.y"
    {
       if (STACK_EMPTY(breakStack) || STACK_PEEK(breakStack) == NULL) {
           werror(E_BREAK_CONTEXT);
           (yyval.asts) = NULL;
       } else {
           (yyval.asts) = newAst_VALUE(symbolVal(STACK_PEEK(breakStack)));
           (yyval.asts) = newNode(GOTO,(yyval.asts),NULL);
           STACK_PEEK(breakStack)->isref = 1;
       }
   }
    break;

  case 280:
#line 1711 "SDCC.y"
    {
       seqPointNo++;
       if (inCritical) {
           werror(E_INVALID_CRITICAL);
           (yyval.asts) = NULL;
       } else {
           (yyval.asts) = newNode(RETURN,NULL,NULL);
       }
   }
    break;

  case 281:
#line 1720 "SDCC.y"
    {
       seqPointNo++;
       if (inCritical) {
           werror(E_INVALID_CRITICAL);
           (yyval.asts) = NULL;
       } else {
           (yyval.asts) = newNode(RETURN,NULL,(yyvsp[(2) - (3)].asts));
       }
   }
    break;

  case 282:
#line 1732 "SDCC.y"
    { (yyval.sym) = newSymbol ((yyvsp[(1) - (1)].yychar),NestLevel) ; }
    break;


/* Line 1267 of yacc.c.  */
#line 4429 "SDCCy.c"
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;


  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (yymsg);
	  }
	else
	  {
	    yyerror (YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse look-ahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse look-ahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  *++yyvsp = yylval;


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#ifndef yyoverflow
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEOF && yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}


#line 1734 "SDCC.y"


