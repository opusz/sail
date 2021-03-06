chapter \<open>Generated by Lem from \<open>riscv_duopod.lem\<close>.\<close>

theory "Riscv_duopod" 

imports
  Main
  "LEM.Lem_pervasives_extra"
  "Sail.Sail2_instr_kinds"
  "Sail.Sail2_values"
  "Sail.Sail2_operators_mwords"
  "Sail.Sail2_prompt_monad"
  "Sail.Sail2_prompt"
  "Sail.Sail2_string"
  "Riscv_duopod_types"
  "Riscv_extras"

begin 

(*Generated by Sail from riscv_duopod.*)
(*open import Pervasives_extra*)
(*open import Sail2_instr_kinds*)
(*open import Sail2_values*)
(*open import Sail2_string*)
(*open import Sail2_operators_mwords*)
(*open import Sail2_prompt_monad*)
(*open import Sail2_prompt*)
(*open import Riscv_duopod_types*)
(*open import Riscv_extras*)

(*val spc_forwards : unit -> string*)

definition spc_forwards  :: " unit \<Rightarrow> string "  where 
     " spc_forwards _ = ( ('' ''))"


(*val spc_backwards : string -> unit*)

definition spc_backwards  :: " string \<Rightarrow> unit "  where 
     " spc_backwards s = ( ()  )"


(*val opt_spc_forwards : unit -> string*)

definition opt_spc_forwards  :: " unit \<Rightarrow> string "  where 
     " opt_spc_forwards _ = ( (''''))"


(*val opt_spc_backwards : string -> unit*)

definition opt_spc_backwards  :: " string \<Rightarrow> unit "  where 
     " opt_spc_backwards s = ( ()  )"


(*val def_spc_forwards : unit -> string*)

definition def_spc_forwards  :: " unit \<Rightarrow> string "  where 
     " def_spc_forwards _ = ( ('' ''))"


(*val def_spc_backwards : string -> unit*)

definition def_spc_backwards  :: " string \<Rightarrow> unit "  where 
     " def_spc_backwards s = ( ()  )"










(*val builtin_and_vec : forall 'n. bits 'n -> bits 'n -> bits 'n*)



(*val builtin_or_vec : forall 'n. bits 'n -> bits 'n -> bits 'n*)



(*val __raw_SetSlice_int : forall 'w. integer -> ii -> ii -> bits 'w -> ii*)

(*val __GetSlice_int : forall 'n . Size 'n => integer -> ii -> ii -> mword 'n*)

definition GetSlice_int  :: " int \<Rightarrow> int \<Rightarrow> int \<Rightarrow>('n::len)Word.word "  where 
     " GetSlice_int n m o1 = ( (get_slice_int n m o1  :: ( 'n::len)Word.word))"


(*val __raw_SetSlice_bits : forall 'n 'w. integer -> integer -> bits 'n -> ii -> bits 'w -> bits 'n*)

(*val __raw_GetSlice_bits : forall 'n 'w . integer -> integer -> bits 'n -> ii -> bits 'w*)

(*val cast_unit_vec : bitU -> mword ty1*)

fun cast_unit_vec0  :: " bitU \<Rightarrow>(1)Word.word "  where 
     " cast_unit_vec0 B0 = ( (vec_of_bits [B0]  ::  1 Word.word))"
|" cast_unit_vec0 B1 = ( (vec_of_bits [B1]  ::  1 Word.word))"


(*val DecStr : ii -> string*)

(*val HexStr : ii -> string*)

(*val __RISCV_write : forall 'int8_times_n. Size 'int8_times_n => mword ty64 -> integer -> mword 'int8_times_n -> M bool*)

definition RISCV_write  :: "(64)Word.word \<Rightarrow> int \<Rightarrow>('int8_times_n::len)Word.word \<Rightarrow>((register_value),(bool),(unit))monad "  where 
     " RISCV_write addr width data = (
   write_ram (( 64 :: int)::ii) width
     (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                   B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                   B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
       ::  64 Word.word) addr data )"


(*val __TraceMemoryWrite : forall 'int8_times_n 'm. integer -> bits 'm -> bits 'int8_times_n -> unit*)

(*val __RISCV_read : forall 'int8_times_n . Size 'int8_times_n => mword ty64 -> integer -> bool -> bool -> bool -> M (maybe (mword 'int8_times_n))*)

fun RISCV_read  :: "(64)Word.word \<Rightarrow> int \<Rightarrow> bool \<Rightarrow> bool \<Rightarrow> bool \<Rightarrow>((register_value),((('int8_times_n::len)Word.word)option),(unit))monad "  where 
     " RISCV_read addr width False False False = (
      (MEMr (( 64 :: int)::ii) width
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word) addr
        :: (( 'int8_times_n::len)Word.word) M) \<bind> (\<lambda> (w__0 :: ( 'int8_times_n::len)Word.word) . 
      return (Some w__0)))"
|" RISCV_read addr width True False False = (
      (MEMr_acquire (( 64 :: int)::ii) width
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word) addr
        :: (( 'int8_times_n::len)Word.word) M) \<bind> (\<lambda> (w__1 :: ( 'int8_times_n::len)Word.word) . 
      return (Some w__1)))"
|" RISCV_read addr width True True False = (
      (MEMr_strong_acquire (( 64 :: int)::ii) width
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word) addr
        :: (( 'int8_times_n::len)Word.word) M) \<bind> (\<lambda> (w__2 :: ( 'int8_times_n::len)Word.word) . 
      return (Some w__2)))"
|" RISCV_read addr width False False True = (
      (MEMr_reserved (( 64 :: int)::ii) width
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word) addr
        :: (( 'int8_times_n::len)Word.word) M) \<bind> (\<lambda> (w__3 :: ( 'int8_times_n::len)Word.word) . 
      return (Some w__3)))"
|" RISCV_read addr width True False True = (
      (MEMr_reserved_acquire (( 64 :: int)::ii) width
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word) addr
        :: (( 'int8_times_n::len)Word.word) M) \<bind> (\<lambda> (w__4 :: ( 'int8_times_n::len)Word.word) . 
      return (Some w__4)))"
|" RISCV_read addr width True True True = (
      (MEMr_reserved_strong_acquire (( 64 :: int)::ii) width
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word) addr
        :: (( 'int8_times_n::len)Word.word) M) \<bind> (\<lambda> (w__5 :: ( 'int8_times_n::len)Word.word) . 
      return (Some w__5)))"
|" RISCV_read addr width False True False = ( return None )"
|" RISCV_read addr width False True True = ( return None )"


(*val __TraceMemoryRead : forall 'int8_times_n 'm. integer -> bits 'm -> bits 'int8_times_n -> unit*)

(*val ex_nat : ii -> integer*)

definition ex_nat  :: " int \<Rightarrow> int "  where 
     " ex_nat n = ( n )"


(*val ex_int : ii -> integer*)

definition ex_int  :: " int \<Rightarrow> int "  where 
     " ex_int n = ( n )"


(*val coerce_int_nat : ii -> M ii*)

definition coerce_int_nat  :: " int \<Rightarrow>((register_value),(int),(unit))monad "  where 
     " coerce_int_nat x = ( assert_exp True ('''') \<then> return x )"


(*val EXTS : forall 'n 'm . Size 'm, Size 'n => integer -> mword 'n -> mword 'm*)

(*val EXTZ : forall 'n 'm . Size 'm, Size 'n => integer -> mword 'n -> mword 'm*)

definition EXTS  :: " int \<Rightarrow>('n::len)Word.word \<Rightarrow>('m::len)Word.word "  where 
     " EXTS (m__tv :: int) v = ( (sign_extend v m__tv  :: ( 'm::len)Word.word))"


definition EXTZ  :: " int \<Rightarrow>('n::len)Word.word \<Rightarrow>('m::len)Word.word "  where 
     " EXTZ (m__tv :: int) v = ( (zero_extend v m__tv  :: ( 'm::len)Word.word))"


(*val zopz0zI_s : forall 'n . Size 'n => mword 'n -> mword 'n -> bool*)

(*val zopz0zKzJ_s : forall 'n . Size 'n => mword 'n -> mword 'n -> bool*)

(*val zopz0zI_u : forall 'n. Size 'n => mword 'n -> mword 'n -> bool*)

(*val zopz0zKzJ_u : forall 'n. Size 'n => mword 'n -> mword 'n -> bool*)

(*val zopz0zIzJ_u : forall 'n. Size 'n => mword 'n -> mword 'n -> bool*)

definition zopz0zI_s  :: "('n::len)Word.word \<Rightarrow>('n::len)Word.word \<Rightarrow> bool "  where 
     " zopz0zI_s x y = ( ((Word.sint x)) < ((Word.sint y)))"


definition zopz0zKzJ_s  :: "('n::len)Word.word \<Rightarrow>('n::len)Word.word \<Rightarrow> bool "  where 
     " zopz0zKzJ_s x y = ( ((Word.sint x)) \<ge> ((Word.sint y)))"


definition zopz0zI_u  :: "('n::len)Word.word \<Rightarrow>('n::len)Word.word \<Rightarrow> bool "  where 
     " zopz0zI_u x y = ( ((Word.uint x)) < ((Word.uint y)))"


definition zopz0zKzJ_u  :: "('n::len)Word.word \<Rightarrow>('n::len)Word.word \<Rightarrow> bool "  where 
     " zopz0zKzJ_u x y = ( ((Word.uint x)) \<ge> ((Word.uint y)))"


definition zopz0zIzJ_u  :: "('n::len)Word.word \<Rightarrow>('n::len)Word.word \<Rightarrow> bool "  where 
     " zopz0zIzJ_u x y = ( ((Word.uint x)) \<le> ((Word.uint y)))"


(*val bool_to_bits : bool -> mword ty1*)

definition bool_to_bits  :: " bool \<Rightarrow>(1)Word.word "  where 
     " bool_to_bits x = ( if x then (vec_of_bits [B1]  ::  1 Word.word) else (vec_of_bits [B0]  ::  1 Word.word))"


(*val bit_to_bool : bitU -> bool*)

fun bit_to_bool  :: " bitU \<Rightarrow> bool "  where 
     " bit_to_bool B1 = ( True )"
|" bit_to_bool B0 = ( False )"


(*val vector64 : ii -> mword ty64*)

definition vector64  :: " int \<Rightarrow>(64)Word.word "  where 
     " vector64 n = ( (get_slice_int (( 64 :: int)::ii) n (( 0 :: int)::ii)  ::  64 Word.word))"


(*val to_bits : forall 'l . Size 'l => integer -> ii -> mword 'l*)

definition to_bits  :: " int \<Rightarrow> int \<Rightarrow>('l::len)Word.word "  where 
     " to_bits l n = ( (get_slice_int l n (( 0 :: int)::ii)  :: ( 'l::len)Word.word))"


(*val shift_right_arith64 : mword ty64 -> mword ty6 -> mword ty64*)

definition shift_right_arith64  :: "(64)Word.word \<Rightarrow>(6)Word.word \<Rightarrow>(64)Word.word "  where 
     " shift_right_arith64 (v :: 64 bits) (shift :: 6 bits) = (
   (let (v128 :: 128 bits) = ((EXTS (( 128 :: int)::ii) v  ::  128 Word.word)) in
   (subrange_vec_dec ((shift_bits_right v128 shift  ::  128 Word.word)) (( 63 :: int)::ii) (( 0 :: int)::ii)  ::  64 Word.word)))"


(*val shift_right_arith32 : mword ty32 -> mword ty5 -> mword ty32*)

definition shift_right_arith32  :: "(32)Word.word \<Rightarrow>(5)Word.word \<Rightarrow>(32)Word.word "  where 
     " shift_right_arith32 (v :: 32 bits) (shift :: 5 bits) = (
   (let (v64 :: 64 bits) = ((EXTS (( 64 :: int)::ii) v  ::  64 Word.word)) in
   (subrange_vec_dec ((shift_bits_right v64 shift  ::  64 Word.word)) (( 31 :: int)::ii) (( 0 :: int)::ii)  ::  32 Word.word)))"


(*val zeros : forall 'n . Size 'n => integer -> mword 'n*)

definition zeros0  :: " int \<Rightarrow>('n::len)Word.word "  where 
     " zeros0 n = ( (replicate_bits (vec_of_bits [B0]  ::  1 Word.word) n  :: ( 'n::len)Word.word))"


(*val regbits_to_regno : mword ty5 -> integer*)

definition regbits_to_regno  :: "(5)Word.word \<Rightarrow> int "  where 
     " regbits_to_regno b = (
   (let r = (Word.uint b) in
   r))"


(*val rX : integer -> M (mword ty64)*)

definition rX  :: " int \<Rightarrow>((register_value),((64)Word.word),(unit))monad "  where 
     " rX l__0 = (
   if (((l__0 = (( 0 :: int)::ii)))) then
     return (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                          B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                          B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
              ::  64 Word.word)
   else
     read_reg Xs_ref \<bind> (\<lambda> (w__0 :: xlen_t list) . 
     return ((access_list_dec w__0 l__0  ::  64 Word.word))))"


(*val wX : integer -> mword ty64 -> M unit*)

definition wX  :: " int \<Rightarrow>(64)Word.word \<Rightarrow>((register_value),(unit),(unit))monad "  where 
     " wX r v = (
   if (((r \<noteq> (( 0 :: int)::ii)))) then
     read_reg Xs_ref \<bind> (\<lambda> (w__0 :: xlen_t list) . 
     write_reg Xs_ref ((update_list_dec w__0 r v  :: ( 64 Word.word) list)))
   else return ()  )"


(*val MEMr : forall 'int8_times_n . Size 'int8_times_n => mword ty64 -> integer -> M (mword 'int8_times_n)*)

definition MEMr0  :: "(64)Word.word \<Rightarrow> int \<Rightarrow>((register_value),(('int8_times_n::len)Word.word),(unit))monad "  where 
     " MEMr0 addr width = (
   (RISCV_read addr width False False False ) \<bind> (\<lambda> w__0 . 
   return ((case  w__0 of
     Some (v) => v
   | None => (zeros0 (((( 8 :: int)::ii) * width))  :: ( 'int8_times_n::len)Word.word)
   ))))"


(*val iop_of_num : integer -> iop*)

definition iop_of_num  :: " int \<Rightarrow> iop "  where 
     " iop_of_num arg0 = (
   (let p00 = arg0 in
   if (((p00 = (( 0 :: int)::ii)))) then RISCV_ADDI
   else if (((p00 = (( 1 :: int)::ii)))) then RISCV_SLTI
   else if (((p00 = (( 2 :: int)::ii)))) then RISCV_SLTIU
   else if (((p00 = (( 3 :: int)::ii)))) then RISCV_XORI
   else if (((p00 = (( 4 :: int)::ii)))) then RISCV_ORI
   else RISCV_ANDI))"


(*val num_of_iop : iop -> integer*)

fun num_of_iop  :: " iop \<Rightarrow> int "  where 
     " num_of_iop RISCV_ADDI = ( (( 0 :: int)::ii))"
|" num_of_iop RISCV_SLTI = ( (( 1 :: int)::ii))"
|" num_of_iop RISCV_SLTIU = ( (( 2 :: int)::ii))"
|" num_of_iop RISCV_XORI = ( (( 3 :: int)::ii))"
|" num_of_iop RISCV_ORI = ( (( 4 :: int)::ii))"
|" num_of_iop RISCV_ANDI = ( (( 5 :: int)::ii))"


(*val decode : mword ty32 -> maybe ast*)

(*val execute : ast -> M unit*)

definition decode  :: "(32)Word.word \<Rightarrow>(ast)option "  where 
     " decode v__0 = (
   if ((((((((subrange_vec_dec v__0 (( 14 :: int)::ii) (( 12 :: int)::ii)  ::  3 Word.word)) = (vec_of_bits [B0,B0,B0]  ::  3 Word.word)))) \<and> (((((subrange_vec_dec v__0 (( 6 :: int)::ii) (( 0 :: int)::ii)  ::  7 Word.word)) = (vec_of_bits [B0,B0,B1,B0,B0,B1,B1]  ::  7 Word.word))))))) then
     (let (imm :: 12 bits) = ((subrange_vec_dec v__0 (( 31 :: int)::ii) (( 20 :: int)::ii)  ::  12 Word.word)) in
     (let (rs1 :: regbits) = ((subrange_vec_dec v__0 (( 19 :: int)::ii) (( 15 :: int)::ii)  ::  5 Word.word)) in
     (let (rd :: regbits) = ((subrange_vec_dec v__0 (( 11 :: int)::ii) (( 7 :: int)::ii)  ::  5 Word.word)) in
     (let (imm :: 12 bits) = ((subrange_vec_dec v__0 (( 31 :: int)::ii) (( 20 :: int)::ii)  ::  12 Word.word)) in
     Some (ITYPE (imm,rs1,rd,RISCV_ADDI))))))
   else if ((((((((subrange_vec_dec v__0 (( 14 :: int)::ii) (( 12 :: int)::ii)  ::  3 Word.word)) = (vec_of_bits [B0,B1,B1]  ::  3 Word.word)))) \<and> (((((subrange_vec_dec v__0 (( 6 :: int)::ii) (( 0 :: int)::ii)  ::  7 Word.word)) = (vec_of_bits [B0,B0,B0,B0,B0,B1,B1]  ::  7 Word.word))))))) then
     (let (imm :: 12 bits) = ((subrange_vec_dec v__0 (( 31 :: int)::ii) (( 20 :: int)::ii)  ::  12 Word.word)) in
     (let (rs1 :: regbits) = ((subrange_vec_dec v__0 (( 19 :: int)::ii) (( 15 :: int)::ii)  ::  5 Word.word)) in
     (let (rd :: regbits) = ((subrange_vec_dec v__0 (( 11 :: int)::ii) (( 7 :: int)::ii)  ::  5 Word.word)) in
     (let (imm :: 12 bits) = ((subrange_vec_dec v__0 (( 31 :: int)::ii) (( 20 :: int)::ii)  ::  12 Word.word)) in
     Some (LOAD (imm,rs1,rd))))))
   else None )"


(*val execute_LOAD : mword ty12 -> mword ty5 -> mword ty5 -> M unit*)

definition execute_LOAD  :: "(12)Word.word \<Rightarrow>(5)Word.word \<Rightarrow>(5)Word.word \<Rightarrow>((register_value),(unit),(unit))monad "  where 
     " execute_LOAD imm rs1 rd = (
   (rX ((regbits_to_regno rs1))  :: ( 64 Word.word) M) \<bind> (\<lambda> (w__0 ::  64 Word.word) . 
   (let (addr :: xlen_t) = ((add_vec w__0 ((EXTS (( 64 :: int)::ii) imm  ::  64 Word.word))  ::  64 Word.word)) in
   (MEMr0 addr (( 8 :: int)::ii)  :: ( 64 Word.word) M) \<bind> (\<lambda> (result :: xlen_t) . 
   wX ((regbits_to_regno rd)) result))))"


(*val execute_ITYPE : mword ty12 -> mword ty5 -> mword ty5 -> iop -> M unit*)

fun execute_ITYPE  :: "(12)Word.word \<Rightarrow>(5)Word.word \<Rightarrow>(5)Word.word \<Rightarrow> iop \<Rightarrow>((register_value),(unit),(unit))monad "  where 
     " execute_ITYPE imm rs1 rd RISCV_ADDI = (
   (rX ((regbits_to_regno rs1))  :: ( 64 Word.word) M) \<bind> (\<lambda> rs1_val . 
   (let (imm_ext :: xlen_t) = ((EXTS (( 64 :: int)::ii) imm  ::  64 Word.word)) in
   (let result = ((add_vec rs1_val imm_ext  ::  64 Word.word)) in
   wX ((regbits_to_regno rd)) result))))"


fun execute  :: " ast \<Rightarrow>((register_value),(unit),(unit))monad "  where 
     " execute (ITYPE (imm,rs1,rd,arg3)) = ( execute_ITYPE imm rs1 rd arg3 )"
|" execute (LOAD (imm,rs1,rd)) = ( execute_LOAD imm rs1 rd )"


definition initial_regstate  :: " regstate "  where 
     " initial_regstate = (
  (| Xs =
       ([(vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word),
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word),
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word),
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word),
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word),
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word),
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word),
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word),
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word),
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word),
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word),
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word),
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word),
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word),
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word),
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word),
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word),
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word),
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word),
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word),
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word),
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word),
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word),
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word),
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word),
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word),
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word),
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word),
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word),
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word),
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word),
         (vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                       B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
           ::  64 Word.word)]), 
     nextPC =
       ((vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                     B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                     B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
         ::  64 Word.word)), 
     PC =
       ((vec_of_bits [B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                     B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,
                     B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0,B0]
         ::  64 Word.word)) |) )"



end
