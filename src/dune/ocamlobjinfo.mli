(** Parse ocamlobjinfo output *)
open Stdune

type t = Module_name.Obj.Set.t Ml_kind.Dict.t

val to_dyn : t -> Dyn.t

val rules :
     dir:Path.Build.t
  -> ctx:Context.t
  -> unit:Path.t
  -> Action.t Build.With_targets.t * t Build.t

(** For testing only *)
val parse : string -> t
