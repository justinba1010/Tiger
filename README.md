# Tiger

This is an implementation of the Tiger Programming Language, but in Ocaml. This is based off of Andrew Appel's [*Modern Compiler Implementation in ML*](https://www.cs.princeton.edu/~appel/modern/ml/). 

I chose Ocaml because it was easier to install on a Raspberry Pi, then *Standard ML of New Jersey*, and that I currently work in Ocaml/ReasonMl, and thought I would go ahead and learn the syntax of Ocaml anyways for future reference and being able to read Ocaml libraries.

Currently I am just following the exercises.

## Chapter 1

* Write an ML function `(maxArgs : stm -> int)` that tells the maximum number of arguments of any `print` statment within any subexpression of a given statement. For example, `maxArgs(prog)` is `2`.
* Write an ML function `interp : stm -> unit` that "interprets" a program in this language. To write in a functional style - without assignment (:=) or arrays - maintain a list of `(variable, integer)` pairs, and produce new versions of this list at each `AssignStm`.

### Chapter 1 Exercises
* 
