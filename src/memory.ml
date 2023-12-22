let interpreter_area memory = Bytes.sub memory 0 512

let make () = Bytes.create 4096
