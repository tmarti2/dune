open Stdune

(** Represents a valid OCaml module name *)
type t

val to_dyn : t -> Dyn.t

include Dune_lang.Conv.S with type t := t

val add_suffix : t -> string -> t

val compare : t -> t -> Ordering.t

val of_string : string -> t

val to_string : t -> string

val uncapitalize : t -> string

val pp_quote : Format.formatter -> t -> unit

module Per_item : Per_item.S with type key = t

module Infix : Comparator.OPS with type t = t

val of_local_lib_name : Lib_name.Local.t -> t

val to_local_lib_name : t -> Lib_name.Local.t

val decode : t Dune_lang.Decoder.t

module Obj : sig
  (** Object names are unique (within a library or executable) module names.
      While they can always be converted to valid module names, they always
      don't correspond names that users see. *)
  type name

  type nonrec t

  val of_string : string -> t

  val of_name : name -> t

  val of_path : Path.t -> t

  val to_dyn : t -> Dyn.t

  val to_name : t -> name

  val compare : t -> t -> Ordering.t

  val fname : t -> ext:string -> string

  include Dune_lang.Conv.S with type t := t

  module Map : Map.S with type key = t

  module Set : Set.S with type elt = t
end
with type name := t

val wrap : t -> with_:t -> Obj.t

module Map : Map.S with type key = t

module Set : sig
  include Set.S with type elt = t

  val to_dyn : t -> Dyn.t
end
