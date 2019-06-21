(* file: lexer.mll *)
{
  open Mfcalc
  open Lexing
  open Help
  let create_hashtable size init =
    let tbl = Hashtbl.create size in
    List.iter (fun (key, data) -> Hashtbl.add tbl key data) init;
    tbl
  let fun_table = create_hashtable 32 [
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
  let ident_num = ['a'-'z' 'A'-'Z' '0'-'9']
  rule token = parse
  | [' ' '\t'] { token lexbuf }
  | '\n' { NEWLINE }
  | digit+
  | "." digit+
  | digit* "." digit* as num
  { NUM (float_of_string num) }
  | '+' { PLUS }
  | '-' { MINUS }
  | '*' { MULTIPLY }
  | '/' { DIVIDE }
  | '^' { CARET }
  | '(' { LPAREN }
  | ')' { RPAREN }
  | '=' { EQ }
  | ident ident_num* as word
  { try
    let f = Hashtbl.find fun_table word in
    FNCT f
  with Not_found -> VAR word
  }
  | _ { token lexbuf }
  | eof { raise End_of_file }
