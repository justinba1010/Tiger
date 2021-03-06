(* Copyright 2019
 * Justin Baum
 * Modern Compiler Implementation in ML
 * Andrew Appel
 * But in Ocaml*
 *)

type id = string

type pair = id * int

type binop =
  | Plus
  | Subt
  | Mult
  | Div

type stm =
  |CompoundStm of stm * stm
  | AssignStm of id * exp
  | PrintStm of exp list
and exp =
  | IdExp of id
  | NumExp of int
  | OpExp of exp * binop * exp
  | EseqExp of stm * exp

let prog =
  CompoundStm(
    AssignStm("a",
      OpExp(NumExp 5, Plus, NumExp 3)),
    CompoundStm(
      AssignStm("b",
        EseqExp(PrintStm([IdExp "a";
          OpExp(IdExp "a", Subt, NumExp 1)
        ]),
        OpExp(NumExp 10, Mult, IdExp "a"))),
      PrintStm([IdExp "b"])
    )
  )

let max: int -> int -> int = fun (a: int) -> fun (b: int) -> match (a > b) with
    | true -> a
    | false -> b


let rec maxArgs: stm -> int = fun (statement: stm) -> match statement with
  | CompoundStm(stm1, stm2) ->
      max ((maxArgs stm1)) ((maxArgs stm2))
  | PrintStm(stms) ->
      maxArgsPrint(stms)
  | _AssignStm ->
      0
and maxArgsPrint = List.length


(* I did not realize our PrintStm didn't take a list of statements... *)
(*maxArgsPrint: stm list -> int = fun (statements: stm list) ->
  List.fold_left (fun acc x -> acc + (maxArgs x)) 0 statements
*)

let rec assoclookup key = function
    | [] -> 0
    | (k, v)::_t when k = key -> v
    | (_k, v)::t -> assoclookup key t


let interp (statement: stm) =
  let rec interpStm: (stm -> pair list -> pair list) = fun (statement: stm) -> fun (ids: pair list) ->
    match statement with
    | AssignStm(id, exp) -> [(id, interpExp exp ids)] @ ids
    | CompoundStm(stm1, stm2) -> interpStm stm2 ids @ interpStm stm1 ids
    | PrintStm(stms) -> (List.iter (fun exp -> (print_int (interpExp exp ids))) stms; ids) 
  and interpExp: (exp -> pair list -> int) = fun (expression: exp) -> fun (pairs: pair list) ->
    match expression with
    | NumExp(num) -> num
    | OpExp(num1, Plus, num2) -> interpExp num1 pairs + interpExp num2 pairs
    | OpExp(num1, Subt, num2) -> interpExp num1 pairs - interpExp num2 pairs
    | OpExp(num1, Mult, num2) -> interpExp num1 pairs * interpExp num2 pairs
    | OpExp(num1, Div, num2) -> interpExp num1 pairs / interpExp num2 pairs
    | EseqExp(_stm, _exp) -> 0 (* Unimplemented currently *)
    | IdExp(id) -> assoclookup id pairs
  in interpStm statement []
let print_2 (pairs : pair list) =
  List.iter
  (fun a ->
    let (id, valu) = a in
    print_string id;
    print_string "-";
    print_int valu;
    print_string ("\n")
  ) pairs
let pairs = interp (prog)
let _ = print_2 (pairs)
