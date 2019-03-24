/** @file asm/gbz80/types.h
    Types definitions for the gb.
*/
#ifndef ASM_GBZ80_TYPES_INCLUDE
#define ASM_GBZ80_TYPES_INCLUDE

/** Signed eight bit.
 */
typedef char          	INT8;
/** Unsigned eight bit.
 */
typedef unsigned char 	UINT8;
/** Signed sixteen bit.
 */
typedef int           	INT16;
/** Unsigned sixteen bit.
 */
typedef unsigned int  	UINT16;
/** Signed 32 bit.
 */
typedef long          	INT32;
/** Unsigned 32 bit.
 */
typedef unsigned long 	UINT32;

#ifndef _SIZE_T_DEFINED
#define _SIZE_T_DEFINED
typedef int	      	size_t;
#endif

#endif
