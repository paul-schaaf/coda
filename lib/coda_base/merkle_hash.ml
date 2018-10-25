open Core
open Snark_params
open Fold_lib
module Account = Account

type t = Tick.Pedersen.Digest.t [@@deriving sexp, hash, compare, bin_io, eq]

let merge ~height h1 h2 =
  let open Tick.Pedersen in
  State.digest
    (hash_fold
       Hash_prefix.merkle_tree.(height)
       Fold.(Digest.fold h1 +> Digest.fold h2))

let of_digest = Fn.id

let of_account = Account.digest
