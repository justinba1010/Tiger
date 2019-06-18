(* format specs for ocamllex *)

(* header section *)

{ (* header *) }

(* definitions section *)
let definition = regex
.
.
.

(* rules section *)
rule some_rule [arg1; arg2; ... argn] = parse
  | pattern { action; some_rule arg1 ... argn lexbuf }
  | ...
and some_other_rule [arg1; arg2; ... argn] = parse
  | ...
and ...

(* trailer section *)
{ trailer }
