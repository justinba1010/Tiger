%{
  open Printf
%}

%token NEWLINE
%token LPAREN RPAREN
%token <float> NUM
%token PLUS MINUS MULTIPLY DIVIDE CARET


/* Define order rules */
%left PLUs MINUS
%left MULTIPLY DIVIDE
%left NEG
%right CARET

%start input
%type <unit> input

/* Grammar */
%%
input: { }
  | input line { }
;
line: NEWLINE { }
  | exp NEWLINE { printf "\t%.10g\n" $1 }
;
exp: NUM { $1 }
  | exp PLUS exp { $1 +. $3 }
  | exp MINUS exp { $1 -. $3 }
  | exp MULTIPLY exp { $1 *. $3 }
  | exp DIVIDE exp { $1 /. $3 }
  | MINUS exp %prec NEG { -. $2 }
  | exp CARET exp { $1 ** $3 }
  | LPAREN exp RPAREN { $2 }
;

%%
