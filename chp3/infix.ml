type token =
  | NEWLINE
  | LPAREN
  | RPAREN
  | NUM of (float)
  | PLUS
  | MINUS
  | MULTIPLY
  | DIVIDE
  | CARET

open Parsing;;
let _ = parse_error;;
# 2 "infix.mly"
  open Printf
# 17 "infix.ml"
let yytransl_const = [|
  257 (* NEWLINE *);
  258 (* LPAREN *);
  259 (* RPAREN *);
  261 (* PLUS *);
  262 (* MINUS *);
  263 (* MULTIPLY *);
  264 (* DIVIDE *);
  265 (* CARET *);
    0|]

let yytransl_block = [|
  260 (* NUM *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\002\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\000\000"

let yylen = "\002\000\
\000\000\002\000\001\000\002\000\001\000\003\000\003\000\003\000\
\003\000\002\000\003\000\003\000\002\000"

let yydefred = "\000\000\
\001\000\000\000\000\000\003\000\000\000\005\000\000\000\002\000\
\000\000\000\000\000\000\004\000\000\000\000\000\000\000\000\000\
\000\000\012\000\000\000\000\000\000\000\000\000\000\000"

let yydgoto = "\002\000\
\003\000\008\000\009\000"

let yysindex = "\014\000\
\000\000\000\000\053\255\000\000\070\255\000\000\070\255\000\000\
\012\255\254\254\068\255\000\000\070\255\070\255\070\255\070\255\
\070\255\000\000\057\255\062\255\068\255\068\255\068\255"

let yyrindex = "\000\000\
\000\000\000\000\023\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\021\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\013\255\055\255\029\255\037\255\045\255"

let yygindex = "\000\000\
\000\000\000\000\251\255"

let yytablesize = 77
let yytable = "\010\000\
\018\000\011\000\013\000\014\000\015\000\016\000\017\000\019\000\
\020\000\021\000\022\000\023\000\012\000\006\000\001\000\006\000\
\013\000\014\000\015\000\016\000\017\000\010\000\013\000\010\000\
\000\000\000\000\010\000\010\000\010\000\008\000\000\000\008\000\
\000\000\000\000\008\000\008\000\008\000\009\000\000\000\009\000\
\000\000\000\000\009\000\009\000\009\000\011\000\000\000\011\000\
\000\000\000\000\011\000\011\000\011\000\004\000\005\000\007\000\
\006\000\007\000\007\000\000\000\007\000\013\000\014\000\015\000\
\016\000\017\000\013\000\000\000\015\000\016\000\017\000\005\000\
\013\000\006\000\000\000\007\000\017\000"

let yycheck = "\005\000\
\003\001\007\000\005\001\006\001\007\001\008\001\009\001\013\000\
\014\000\015\000\016\000\017\000\001\001\001\001\001\000\003\001\
\005\001\006\001\007\001\008\001\009\001\001\001\000\000\003\001\
\255\255\255\255\006\001\007\001\008\001\001\001\255\255\003\001\
\255\255\255\255\006\001\007\001\008\001\001\001\255\255\003\001\
\255\255\255\255\006\001\007\001\008\001\001\001\255\255\003\001\
\255\255\255\255\006\001\007\001\008\001\001\001\002\001\001\001\
\004\001\003\001\006\001\255\255\006\001\005\001\006\001\007\001\
\008\001\009\001\005\001\255\255\007\001\008\001\009\001\002\001\
\005\001\004\001\255\255\006\001\009\001"

let yynames_const = "\
  NEWLINE\000\
  LPAREN\000\
  RPAREN\000\
  PLUS\000\
  MINUS\000\
  MULTIPLY\000\
  DIVIDE\000\
  CARET\000\
  "

let yynames_block = "\
  NUM\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    Obj.repr(
# 22 "infix.mly"
       ( )
# 108 "infix.ml"
               : unit))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : unit) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'line) in
    Obj.repr(
# 23 "infix.mly"
               ( )
# 116 "infix.ml"
               : unit))
; (fun __caml_parser_env ->
    Obj.repr(
# 25 "infix.mly"
              ( )
# 122 "infix.ml"
               : 'line))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'exp) in
    Obj.repr(
# 26 "infix.mly"
                ( printf "\t%.10g\n" _1 )
# 129 "infix.ml"
               : 'line))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 28 "infix.mly"
         ( _1 )
# 136 "infix.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 29 "infix.mly"
                 ( _1 +. _3 )
# 144 "infix.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 30 "infix.mly"
                  ( _1 -. _3 )
# 152 "infix.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 31 "infix.mly"
                     ( _1 *. _3 )
# 160 "infix.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 32 "infix.mly"
                   ( _1 /. _3 )
# 168 "infix.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 33 "infix.mly"
                        ( -. _2 )
# 175 "infix.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 34 "infix.mly"
                  ( _1 ** _3 )
# 183 "infix.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'exp) in
    Obj.repr(
# 35 "infix.mly"
                      ( _2 )
# 190 "infix.ml"
               : 'exp))
(* Entry input *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let input (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : unit)
;;
