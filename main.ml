open Foo


let () =
  print_string "hello world";
  print_int @@ Foo.bar 1 2;
