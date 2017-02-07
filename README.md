# Js_of_ocaml debug with sourcemaps example

🐫 Ocaml -> 💻 byte.code w/ debug info -> 🍩 JS w/ sourcemaps

## Intro

Dead-simple example how to use debugger with sourcemaps. 

## Installation

First, clone the project:

```bash
$ git clone https://github.com/tte/js_of_ocaml-debug-sourcemaps-example.git <my-project-name>
$ cd <my-project-name>
```

Make sure that you have already installed `opam` and `js_of_ocaml` package

```bash
$ opam install js_of_ocaml
```

Then install `node-inspector` for debugging.

```bash
$ npm i -g node-inspector
```

## Run 

```bash
$ make run
```

This command will compile byte code w/ debuginfo to `_build` folder. After success compilation `js_of_ocaml` will handle your byte code w/ sourcemaps. Ok, we have already compiled `main.js` file and we can easily debug this with `node-debug`.

```bash
$ node-debug main.js
```

You should see output with endpoint to your localhost. 

```bash
Node Inspector v0.12.8
Visit http://127.0.0.1:8080/?port=5858 to start debugging.
Debugging `main.js`

Debugger listening on port 5858
```

In our module `Foo.ml` we are using `js_of_ocaml` function `Js.debugger`. Execution of your program will stop at this point and you can check `ml` files in browser's console.

## Other commands

```bash
$ make recompile
$ make clear
```

## Notes

If you have any questions or suggestions, just use issue tracker or make PR.

Based on official docs of `js_of_ocaml`. For more explanations check this notes:

https://ocsigen.org/js_of_ocaml/dev/manual/debug

https://www.npmjs.com/package/node-inspector

https://nodejs.org/api/debugger.html
