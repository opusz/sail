module Big_int = Nat_big_num

type 'a return = { return : 'b . 'a -> 'b }

let opt_trace = ref false

let trace_depth = ref 0
let random = ref false

let sail_call (type t) (f : _ -> t) =
  let module M =
    struct exception Return of t end
  in
  let return = { return = (fun x -> raise (M.Return x)) } in
  try
    f return
  with M.Return x -> x

let trace str =
  if !opt_trace
  then
    begin
      if !trace_depth < 0 then trace_depth := 0 else ();
      prerr_endline (String.make (!trace_depth * 2) ' ' ^ str)
    end
  else ()

let trace_write name str =
  trace ("Write: " ^ name ^ " " ^ str)

let trace_read name str =
  trace ("Read: " ^ name ^ " " ^ str)

let sail_trace_call (type t) (name : string) (in_string : string) (string_of_out : t -> string) (f : _ -> t) =
  let module M =
    struct exception Return of t end
  in
  let return = { return = (fun x -> raise (M.Return x)) } in
  trace ("Call: " ^ name ^ " " ^ in_string);
  incr trace_depth;
  let result = try f return with M.Return x -> x in
  decr trace_depth;
  trace ("Return: " ^ string_of_out result);
  result

let trace_call str =
  trace str; incr trace_depth

type bit = B0 | B1

let and_bit = function
  | B1, B1 -> B1
  | _, _ -> B0

let or_bit = function
  | B0, B0 -> B0
  | _, _ -> B1

let xor_bit = function
  | B1, B0 -> B1
  | B0, B1 -> B1
  | _, _ -> B0

let and_vec (xs, ys) =
  assert (List.length xs = List.length ys);
  List.map2 (fun x y -> and_bit (x, y)) xs ys

let and_bool (b1, b2) = b1 && b2

let or_vec (xs, ys) =
  assert (List.length xs = List.length ys);
  List.map2 (fun x y -> or_bit (x, y)) xs ys

let or_bool (b1, b2) = b1 || b2

let xor_vec (xs, ys) =
  assert (List.length xs = List.length ys);
  List.map2 (fun x y -> xor_bit (x, y)) xs ys

let xor_bool (b1, b2) = (b1 || b2) && (b1 != b2)

let undefined_bit () =
  if !random
  then (if Random.bool () then B0 else B1)
  else B0

let undefined_bool () =
  if !random then Random.bool () else false

let rec undefined_vector (start_index, len, item) =
  if Big_int.equal len Big_int.zero
  then []
  else item :: undefined_vector (start_index, Big_int.sub len (Big_int.of_int 1), item)

let undefined_string () = ""

let undefined_unit () = ()

let undefined_int () =
  if !random then Big_int.of_int (Random.int 0xFFFF) else Big_int.zero

let undefined_nat () = Big_int.zero

let undefined_range (lo, hi) = lo

let internal_pick list =
  if !random
  then List.nth list (Random.int (List.length list))
  else List.nth list 0

let eq_int (n, m) = Big_int.equal n m

let rec drop n xs =
  match n, xs with
  | 0, xs -> xs
  | n, [] -> []
  | n, (x :: xs) -> drop (n -1) xs

let rec take n xs =
  match n, xs with
  | 0, xs -> []
  | n, (x :: xs) -> x :: take (n - 1) xs
  | n, [] -> []

let subrange (list, n, m) =
  let n = Big_int.to_int n in
  let m = Big_int.to_int m in
  List.rev (take (n - (m - 1)) (drop m (List.rev list)))

let slice (list, n, m) =
  let n = Big_int.to_int n in
  let m = Big_int.to_int m in
  List.rev (take m (drop n (List.rev list)))

let eq_list (xs, ys) = List.for_all2 (fun x y -> x = y) xs ys

let access (xs, n) = List.nth (List.rev xs) (Big_int.to_int n)

let append (xs, ys) = xs @ ys

let update (xs, n, x) =
  let n = (List.length xs - Big_int.to_int n) - 1 in
  take n xs @ [x] @ drop (n + 1) xs

let update_subrange (xs, n, m, ys) =
  let rec aux xs o = function
    | [] -> xs
    | (y :: ys) -> aux (update (xs, o, y)) (Big_int.sub o (Big_int.of_int 1)) ys
  in
  aux xs n ys


let length xs = Big_int.of_int (List.length xs)

let big_int_of_bit = function
  | B0 -> Big_int.zero
  | B1 -> (Big_int.of_int 1)

let uint xs =
  let uint_bit x (n, pos) =
    Big_int.add n (Big_int.mul (Big_int.pow_int_positive 2 pos) (big_int_of_bit x)), pos + 1
  in
  fst (List.fold_right uint_bit xs (Big_int.zero, 0))

let sint = function
  | [] -> Big_int.zero
  | [msb] -> Big_int.negate (big_int_of_bit msb)
  | msb :: xs ->
     let msb_pos = List.length xs in
     let complement =
       Big_int.negate (Big_int.mul (Big_int.pow_int_positive 2 msb_pos) (big_int_of_bit msb))
     in
     Big_int.add complement (uint xs)

let add (x, y) = Big_int.add x y
let sub (x, y) = Big_int.sub x y
let mult (x, y) = Big_int.mul x y
let quotient (x, y) = Big_int.div x y
let modulus (x, y) = Big_int.modulus x y

let add_bit_with_carry (x, y, carry) =
  match x, y, carry with
  | B0, B0, B0 -> B0, B0
  | B0, B1, B0 -> B1, B0
  | B1, B0, B0 -> B1, B0
  | B1, B1, B0 -> B0, B1
  | B0, B0, B1 -> B1, B0
  | B0, B1, B1 -> B0, B1
  | B1, B0, B1 -> B0, B1
  | B1, B1, B1 -> B1, B1

let sub_bit_with_carry (x, y, carry) =
  match x, y, carry with
  | B0, B0, B0 -> B0, B0
  | B0, B1, B0 -> B0, B1
  | B1, B0, B0 -> B1, B0
  | B1, B1, B0 -> B0, B0
  | B0, B0, B1 -> B1, B0
  | B0, B1, B1 -> B0, B0
  | B1, B0, B1 -> B1, B1
  | B1, B1, B1 -> B1, B0

let not_bit = function
  | B0 -> B1
  | B1 -> B0

let not_vec xs = List.map not_bit xs

let add_vec_carry (xs, ys) =
  assert (List.length xs = List.length ys);
  let (carry, result) =
    List.fold_right2 (fun x y (c, result) -> let (z, c) = add_bit_with_carry (x, y, c) in (c, z :: result)) xs ys (B0, [])
  in
  carry, result

let add_vec (xs, ys) = snd (add_vec_carry (xs, ys))

let rec replicate_bits (bits, n) =
  if Big_int.less_equal n Big_int.zero
  then []
  else bits @ replicate_bits (bits, Big_int.sub n (Big_int.of_int 1))

let identity x = x

let rec bits_of_big_int bit n =
  if not (Big_int.equal bit Big_int.zero)
  then
    begin
      if Big_int.greater (Big_int.div n bit) Big_int.zero
      then B1 :: bits_of_big_int (Big_int.div bit (Big_int.of_int 2)) (Big_int.sub n bit)
      else B0 :: bits_of_big_int (Big_int.div bit (Big_int.of_int 2)) n
    end
  else []

let add_vec_int (v, n) =
  let n_bits = bits_of_big_int (Big_int.pow_int_positive 2 (List.length v - 1)) n in
  add_vec(v, n_bits)

let sub_vec (xs, ys) = add_vec (xs, add_vec_int (not_vec ys, (Big_int.of_int 1)))

let sub_vec_int (v, n) =
  let n_bits = bits_of_big_int (Big_int.pow_int_positive 2 (List.length v - 1)) n in
  sub_vec(v, n_bits)

let get_slice_int (n, m, o) =
  let bits = bits_of_big_int (Big_int.pow_int_positive 2 (Big_int.add n o |> Big_int.to_int)) (Big_int.abs m) in
  let bits =
    if Big_int.less m Big_int.zero
    then sub_vec (List.map (fun _ -> B0) bits, bits)
    else bits
  in
  let slice = List.rev (take (Big_int.to_int n) (drop (Big_int.to_int o) (List.rev bits))) in
  assert (Big_int.equal (Big_int.of_int (List.length slice)) n);
  slice

let hex_char = function
  | '0' -> [B0; B0; B0; B0]
  | '1' -> [B0; B0; B0; B1]
  | '2' -> [B0; B0; B1; B0]
  | '3' -> [B0; B0; B1; B1]
  | '4' -> [B0; B1; B0; B0]
  | '5' -> [B0; B1; B0; B1]
  | '6' -> [B0; B1; B1; B0]
  | '7' -> [B0; B1; B1; B1]
  | '8' -> [B1; B0; B0; B0]
  | '9' -> [B1; B0; B0; B1]
  | 'A' | 'a' -> [B1; B0; B1; B0]
  | 'B' | 'b' -> [B1; B0; B1; B1]
  | 'C' | 'c' -> [B1; B1; B0; B0]
  | 'D' | 'd' -> [B1; B1; B0; B1]
  | 'E' | 'e' -> [B1; B1; B1; B0]
  | 'F' | 'f' -> [B1; B1; B1; B1]

let list_of_string s =
  let rec aux i acc =
    if i < 0 then acc
    else aux (i-1) (s.[i] :: acc)
  in aux (String.length s - 1) []

let bits_of_string str =
  List.concat (List.map hex_char (list_of_string str))

let concat_str (str1, str2) = str1 ^ str2

let rec break n = function
  | [] -> []
  | (_ :: _ as xs) -> [take n xs] @ break n (drop n xs)

let string_of_bit = function
  | B0 -> "0"
  | B1 -> "1"

let string_of_hex = function
  | [B0; B0; B0; B0] -> "0"
  | [B0; B0; B0; B1] -> "1"
  | [B0; B0; B1; B0] -> "2"
  | [B0; B0; B1; B1] -> "3"
  | [B0; B1; B0; B0] -> "4"
  | [B0; B1; B0; B1] -> "5"
  | [B0; B1; B1; B0] -> "6"
  | [B0; B1; B1; B1] -> "7"
  | [B1; B0; B0; B0] -> "8"
  | [B1; B0; B0; B1] -> "9"
  | [B1; B0; B1; B0] -> "A"
  | [B1; B0; B1; B1] -> "B"
  | [B1; B1; B0; B0] -> "C"
  | [B1; B1; B0; B1] -> "D"
  | [B1; B1; B1; B0] -> "E"
  | [B1; B1; B1; B1] -> "F"

let string_of_bits bits =
  if List.length bits mod 4 == 0
  then "0x" ^ String.concat "" (List.map string_of_hex (break 4 bits))
  else "0b" ^ String.concat "" (List.map string_of_bit bits)

let hex_slice (str, n, m) =
  let bits = List.concat (List.map hex_char (list_of_string (String.sub str 2 (String.length str - 2)))) in
  let padding = replicate_bits([B0], n) in
  let bits = padding @ bits in
  let slice = List.rev (take (Big_int.to_int n) (drop (Big_int.to_int m) (List.rev bits))) in
  slice

let putchar n =
  print_char (char_of_int (Big_int.to_int n));
  flush stdout

let rec bits_of_int bit n =
  if bit <> 0
  then
    begin
      if n / bit > 0
      then B1 :: bits_of_int (bit / 2) (n - bit)
      else B0 :: bits_of_int (bit / 2) n
    end
  else []

let byte_of_int n = bits_of_int 128 n

module BigIntHash =
  struct
    type t = Big_int.num
    let equal i j = Big_int.equal i j
    let hash i = Hashtbl.hash i
  end

module RAM = Hashtbl.Make(BigIntHash)

let ram : int RAM.t = RAM.create 256

let write_ram' (addr_size, data_size, hex_ram, addr, data) =
  let data = List.map (fun byte -> Big_int.to_int (uint byte)) (break 8 data) in
  let rec write_byte i byte =
    trace (Printf.sprintf "Store: %s 0x%02X" (Big_int.to_string (Big_int.add addr (Big_int.of_int i))) byte);
    RAM.add ram (Big_int.add addr (Big_int.of_int i)) byte
  in
  List.iteri write_byte (List.rev data)

let write_ram (addr_size, data_size, hex_ram, addr, data) =
  write_ram' (addr_size, data_size, hex_ram, uint addr, data)

let wram addr byte =
  RAM.add ram addr byte

let read_ram (addr_size, data_size, hex_ram, addr) =
  let addr = uint addr in
  let rec read_byte i =
    if Big_int.equal i Big_int.zero
    then []
    else
      begin
        let loc = Big_int.sub (Big_int.add addr i) (Big_int.of_int 1) in
        let byte = try RAM.find ram loc with Not_found -> 0 in
        trace (Printf.sprintf "Load: %s 0x%02X" (Big_int.to_string loc) byte);
        byte_of_int byte @ read_byte (Big_int.sub i (Big_int.of_int 1))
      end
  in
  read_byte data_size

let rec reverse_endianness bits =
  if List.length bits <= 8 then bits else
  reverse_endianness (drop 8 bits) @ (take 8 bits)

(* FIXME: Casts can't be externed *)
let zcast_unit_vec x = [x]

let shl_int (n, m) = Big_int.shift_left n (Big_int.to_int m)
let shr_int (n, m) = Big_int.shift_right n (Big_int.to_int m)

let debug (str1, n, str2, v) = prerr_endline (str1 ^ Big_int.to_string n ^ str2 ^ string_of_bits v)

let eq_string (str1, str2) = String.compare str1 str2 == 0

let lt_int (x, y) = Big_int.less x y

let set_slice (out_len, slice_len, out, n, slice) =
  let out = update_subrange(out, Big_int.add n (Big_int.of_int (List.length slice - 1)), n, slice) in
  assert (List.length out = Big_int.to_int out_len);
  out

let set_slice_int (_, _, _, _) = assert false

(*
let eq_real (x, y) = Num.eq_num x y
let lt_real (x, y) = Num.lt_num x y
let gt_real (x, y) = Num.gt_num x y
let lteq_real (x, y) = Num.le_num x y
let gteq_real (x, y) = Num.ge_num x y

let round_down x = Num.big_int_of_num (Num.floor_num x)
let round_up x = Num.big_int_of_num (Num.ceiling_num x)
let quotient_real (x, y) = Num.div_num x y
let mult_real (x, y) = Num.mult_num x y
let real_power (x, y) = Num.power_num x (Num.num_of_big_int y)
let add_real (x, y) = Num.add_num x y
let sub_real (x, y) = Num.sub_num x y

let abs_real x = Num.abs_num x
 *)

let lt (x, y) = Big_int.less x y
let gt (x, y) = Big_int.greater x y
let lteq (x, y) = Big_int.less_equal x y
let gteq (x, y) = Big_int.greater_equal x y

let pow2 x = Big_int.pow_int x 2

let max_int (x, y) = Big_int.max x y
let min_int (x, y) = Big_int.min x y
let abs_int x = Big_int.abs x

(*
let undefined_real () = Num.num_of_int 0

let real_of_string str =
  try
    let point = String.index str '.' in
    let whole = Num.num_of_string (String.sub str 0 point) in
    let frac_str = String.sub str (point + 1) (String.length str - (point + 1)) in
    let frac = Num.div_num (Num.num_of_string frac_str) (Num.num_of_big_int (Big_int.pow_int_positive 10 (String.length frac_str))) in
    Num.add_num whole frac
  with
  | Not_found -> Num.num_of_string str

(* Not a very good sqrt implementation *)
let sqrt_real x = real_of_string (string_of_float (sqrt (Num.float_of_num x)))
 *)

let print_int (str, x) =
  print_endline (str ^ Big_int.to_string x)

let print_bits (str, xs) =
  print_endline (str ^ string_of_bits xs)

let reg_deref r = !r

let string_of_zbit = function
  | B0 -> "0"
  | B1 -> "1"
let string_of_znat n = Big_int.to_string n
let string_of_zint n = Big_int.to_string n
let string_of_zunit () = "()"
let string_of_zbool = function
  | true -> "true"
  | false -> "false"
(* let string_of_zreal r = Num.string_of_num r *)
let string_of_zstring str = "\"" ^ String.escaped str ^ "\""

let rec string_of_list sep string_of = function
  | [] -> ""
  | [x] -> string_of x
  | x::ls -> (string_of x) ^ sep ^ (string_of_list sep string_of ls)

let zero_extend (vec, n) =
  let m = Big_int.to_int n in
  if m <= List.length vec
  then take m vec
  else replicate_bits ([B0], Big_int.of_int (m - List.length vec)) @ vec