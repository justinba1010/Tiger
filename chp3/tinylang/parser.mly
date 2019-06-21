/* Copyright 2019 Justin Baum
   Tiny Lang Parser
   parser.mly
   20 June 2019
*/
%{
  open Printf
  open Lexing
  let var_table = Hashtbh.create 16
%}

%token NEWLINE
%token LPAREN RPAREN EQ
%token <float> FLOAT
%token PLUS MINUS MULTIPLY DIVIDE CARET
%token <string> VAR
%token <float->float> FNCT
%left PLUS MINUS
%left MULTIPLY DIVIDE
%left NEG
%right CARET

%start input
%type <unit> input

%%
input: { }
;
line:
  | NEWLINE { }
  | exp NEWLINE { printf "\t%.10

/* Realizing can't figure out type systems
*/
