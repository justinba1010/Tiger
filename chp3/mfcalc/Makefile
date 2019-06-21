main:
	ocamlyacc mfcalc.mly
	ocamlc -c mfcalc.mli
	ocamllex lexer.mll
	ocamlc -c help.ml
	ocamlc -c lexer.ml help.cmo
	ocamlc -c mfcalc.ml
	ocamlc -c main.ml help.cmo
	ocamlc -o mfcalc help.cmo lexer.cmo mfcalc.cmo main.cmo
	rm mfcalc.mli lexer.ml mfcalc.ml *.cmo *.cmi
