(* Copyright 2019 Justin Baum
 * Tiny Lang Lexer
 * lexer.mll
 * 20 June 2019
*)

{
  (* open Parser *)
  open Lexing

  let fun_table = create_hashtable 16 [
    ("sin", sin);
    ("cos", cos);
    ("tan", tan);
    ("asin", asin);
    ("acos", acos);
    ("atan", atan);
    ("log", log);
    ("exp", exp);
    ("sqrt", sqrt);
    ("asin", asin);
    ("acos", acos);
    ("tan", atan);
    ("abs", abs_float);
    ("sind", sind);
    ("cosd", cosd);
    ("tand", tand);
    ("xxx", fun x -> x);
  ]
}

  let digit = ['0'-'9']
  let ident = ['a'-'z' 'A'-'Z']
  let ident_num ['a'-'z' 'A'-'Z']
  let comment_internals = ['\x20'-'\x7f' '\n']

  rule token = parse
  | [' ' '\t'] { token lexbuf }
  | '\n' { NEWLINE }
  | digit+ as int {
  | digit*"."
