main:
	ocamlyacc ltcalc.mly
	ocamlc -c ltcalc.mli
	ocamllex lexer.mll
	ocamlc -c lexer.ml
	ocamlc -c ltcalc.ml
	ocamlc -c main.ml
	ocamlc -o ltcalc lexer.cmo ltcalc.cmo main.cmo
	rm ltcalc.mli lexer.ml ltcalc.ml *.cmo *.cmi
