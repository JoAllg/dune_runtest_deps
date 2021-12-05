Test that deps are recognized and usable in test.ml

  $ cat >test.ml <<EOF
  > let () =
  >   let channel = open_in "./sub/file.txt"
  >   in
  >   let line = input_line channel in
  >   print_endline line
  > EOF
  
  $ cat >dune-project <<EOF
  > (lang dune 2.9)
  > EOF
  
  $ cat >dune <<EOF
  > (library
  >  (name test)
  >  (inline_tests (deps (universe)))
  >  (preprocess (pps ppx_expect)))
  > EOF

Test that dependency /sub/text.ml is available after precombiling
  $ dune build
  $ dune runtest
  inline_test_runner_test alias runtest
  Hello World  
  
Test that dependency /sub/text.ml is available without precompiling
  $ dune runtest
  inline_test_runner_test alias runtest
  Hello World