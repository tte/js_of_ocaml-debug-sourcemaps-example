# Js_of_ocaml debug with sourcemaps example

🐫 Ocaml -> 💻 byte.code w/ debug info -> 🍩 JS w/ sourcemaps

## Intro

I read official `js_of_ocaml` debug notes and *it wasn't so clear for me*. Then I tried to create my own dead-simple example. If you know how to make it better - just let me know!

## Installation

First, clone the project:

```bash
$ git clone   <my-project-name>
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

You should see an endpoint to your local 

## Run 

```bash
$ make test
```

This command will compile byte code w/ debuginfo to `_build_test` folder. After success compilation `js_of_ocaml` will handle your byte code w/ sourcemaps. Ok, we have already compiled `debug.js` file and we can easily debug this with `node-debug`.

```bash
$ node-debug debug.js
```

In our module `A.ml` we are using `js_of_ocaml` function `Js.debugger`. Execution of your program will stop at this point and you can check `ml` files in browser's console.

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