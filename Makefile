BUILD_DIR=_build
TEST_BUILD_DIR=_build_test
compile_tests: 
	ocamlc -g debug.byte
	js_of_ocaml --debuginfo –-source-map test.byte

compile_tests_2: 
	ocamlbuild -cflag -g -build-dir $(TEST_BUILD_DIR) -X $(BUILD_DIR) -use-ocamlfind -no-sanitize -no-hygiene debug.byte
	js_of_ocaml --debuginfo –-source-map $(TEST_BUILD_DIR)/test.byte

.PHONY: test
test: compile_tests
	node test.js
