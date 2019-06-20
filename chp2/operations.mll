(* Copyright 2019 Justin Baum *)

{
  open Printf
}

let digit = ['0'-'9']
let plus = '+'
let minus = '-'
let times = '*'
let div = '/'
let op = '('
let cp = ')'
type exp = 
  | Plus of exp * exp
  | Minus of exp * exp
  | Times of exp * exp
  | Div of exp * exp
  | Paren of exp
  | Num of int
  | None

rule lexer tree = parse
  | digit+ as num
    { get_exp (match tree with
      | None -> Num(int_of_string num)
      | _ -> Num(int_of_string num)
    ) lexbuf }
  | cp
    { lexer Paren(None) lexbuf }
  | _ -> lexer None lexbuf
and get_exp tree
