BUILD_DIR=_build

compile: 
	ocamlbuild -use-ocamlfind -tags "debug","traverse" -r -cflag "-g" -build-dir $(BUILD_DIR) -package js_of_ocaml -no-sanitize -no-hygiene main.byte
	js_of_ocaml --source-map $(BUILD_DIR)/main.byte -o $(BUILD_DIR)/main.js

.PHONY: run
run: compile
	node $(BUILD_DIR)/main.js

.PHONY: clear
clear: 
	rm -rf $(BUILD_DIR) || true

.PHONY: recompile
recompile: clear run