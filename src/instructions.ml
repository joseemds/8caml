type t =
  | Clear
  | Return
  | Jump(Bytes.t)
  | Call(Bytes.t)
  | SetRegister(int * int)
  | ADD(int * int)
  | SUB(int * int)
  | LD(int * int)
  | OR(int * int)
  | AND(int * int)
  | XOR(int * int)
  | SkipIf(register * register)
  | Invalid
