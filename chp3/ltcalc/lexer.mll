(* file: lexer.mll *)
(* Lexical analyzer returns one of the tokens:
  * the token NUM of a floating point number,
  * operators (PLUS, MINUS, MULTIPLY, DIVIDE, CARET, UMINUS),
  * or NEWLINE. It skips all blanks and tabs, and unknown characters
  * and raises End_of_file on EOF. *)
{
  open Ltcalc
  open Lexing
  let incr_lineno lexbuf =
    let pos = lexbuf.lex_curr_p in
    lexbuf.lex_curr_p <- { pos with
    pos_lnum = pos.pos_lnum + 1;
    pos_bol = pos.pos_cnum;
    }
  let comment_depth = ref 0
}

let digit = ['0'-'9']
rule token = parse
  | [' ' '\t'] { token lexbuf }
  | "(*"
    { comment_depth := 1;
        token lexbuf }
  | '\n' { incr_lineno lexbuf; NEWLINE }
  | digit+
  | "." digit+
  | digit+ "." digit* as num
  { NUM (float_of_string num) }
  | '+' { PLUS }
  | '-' { MINUS }
  | '*' { MULTIPLY }
  | '/' { DIVIDE }
  | '^' { CARET }
  | '(' { LPAREN }
  | ')' { RPAREN }
  | _ { token lexbuf }
  | eof { raise End_of_file }

and comment = parse
  | "(*"
    { incr comment_depth; comment lexbuf }
  | "*)"
    { decr comment_depth;
      if !comment_depth = 0 then () else comment lexbuf }
  | eof
    { raise End_of_file }
  | _
    { comment lexbuf }

