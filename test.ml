let () =
    let channel = open_in "./sub/file.txt"
    in
    let line = input_line channel in
    print_endline line
;;