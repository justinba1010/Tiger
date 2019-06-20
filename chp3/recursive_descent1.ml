(* Copyright 2019 Justin Baum
 * Andrew Appel's MCI ML
 * Recursive Descent
*)

type token =
  | IF
  | THEN
  | ELSE
  | BEGIN
  | END
  | PRINT
  | SEMI
  | NUM
  | EQ

type fake_stream = token list

let stream = ref [IF; THEN; ELSE; PRINT; NUM]

let tok = ref BEGIN 
let rec advance () = tok := getToken ()
and eat t = if (!tok = t) then advance () else exit 0
and getToken () =
  match !stream with
    | [] -> exit 0
    | head::tail -> (
      stream := tail;
      tok := head;
      head
    )

let rec s () =
  match !tok with
    | IF -> (
      eat (IF);
      e ();
      eat (THEN);
      s ();
      eat (ELSE);
      s ()
    )
    | BEGIN -> (
      eat (BEGIN);
      s ();
      l ()
    )
    | PRINT -> (
      eat (PRINT);
      e ()
    )
and l () = 
  match !tok with
    | END -> eat (END)
    | SEMI -> (
      eat (SEMI);
      s ();
      l ()
    )
and e () = (
  eat NUM;
  eat EQ;
  eat NUM
)

