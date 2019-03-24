/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

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
/* Line 1489 of yacc.c.  */
#line 301 "SDCCy.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

