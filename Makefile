BUILD_DIR=_build
TEST_BUILD_DIR=_build_test
SHIT=js_of_ocaml --debuginfo --source-map-inline –-source-map debug.byte -o debug.js
compile_tests: 
	ocamlbuild -use-ocamlfind -tags "debug","traverse" -r -cflag "-g" -build-dir $(TEST_BUILD_DIR) -X $(BUILD_DIR) -package js_of_ocaml -no-sanitize -no-hygiene debug.byte
	js_of_ocaml --source-map $(TEST_BUILD_DIR)/debug.byte -o $(TEST_BUILD_DIR)/debug.js
	cp $(TEST_BUILD_DIR)/debug.map debug.map
	cp $(TEST_BUILD_DIR)/debug.js debug.js

.PHONY: test
test: compile_tests
	node $(TEST_BUILD_DIR)/debug.js

.PHONY: clear
clear: 
	-rm debug.js
	-rm debug.map
	-rm -rf _build_test

.PHONY: recompile
recompile: clear test