(* Copyright 2019 Justin Baum
 * Andrew Appel's Modern Compiler Implementation in ML
 * chapter 2.5
*)

(* header *)

{
  type linenum = int
  type token =
    | Type of linenum * linenum
    | Var of linenum * linenum
    | Function of linenum * linenum
    | Break of linenum * linenum
    | Of of 
    | Break of linenum * linenum
    | End of linenum * linenum
    | In of linenum * linenum
    | Let of linenum * linenum
    | 

