module Nibble = struct
  type t = (int * int * int * int)
  let first_nibble byte = byte land 0xF00 lsr 12
  let second_nibble byte = byte land 0XF00 lsr 8
  let third_nibble byte = byte land 0X0F0 lsr 4
  let last_nibble byte = byte land 0X00F

  let nibble_of_hex hex =
    (first_nibble hex, second_nibble hex, third_nibble hex, last_nibble hex)
end

type t =
  | Clear
  | Return
  | Add of int * int
  | Sub of int * int
  | Ld of int * int
  | Or of int * int
  | And of int * int
  | Xor of int * int
  | Jump of Bytes.t
  | Call of Bytes.t
  | SetRegister of int * int
  | SkipIf of Cpu.Register.t * Cpu.Register.t
  | Invalid

let instruction_of_hex hex =
  let nibbles = Nibble.nibble_of_hex hex in
  match nibbles with
  | 0x0, 0x0, 0xE, 0x0 -> Clear
  | 0x0, 0x0, 0xE, 0xE -> Return
  (* | 0x1, n1, n2, n3 *)
  (* | 0x2, n1, n2, n3 *)
  (* | 0x3, x, k1, k2 *)
  (* | 0x4, x, k1, k2 *)
  (* | 0x5, x, y, 0x0 *)
  (* | 0x6, x, k1, k2 *)
  (* | 0x7, x, k1, k2 *)
  (* | 0x8, x, y, 0x0 *)
  (* | 0x8, x, y, 0x1 *)
  (* | 0x8, x, y, 0x2 *)
  (* | 0x8, x, y, 0x3 *)
  (* | 0x8, x, y, 0x5 *)
  (* | 0x8, x, y, 0x6 *)
  (* | 0x8, x, y, 0x7 *)
  (* | 0x8, x, y, 0xE *)
  (* | 0x9, x, y, 0x0 *)
  (* | 0xA, n1, n2, n3 *)
  (* | 0xB, n1, n2, n3 *)
  (* | 0xC, x, k1, k2 *)
  (* | 0xD, x, y, n *)
  | _, _, _, _ -> Invalid
