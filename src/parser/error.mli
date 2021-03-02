type full_location_payload = { location : Location_.span; message : string }

type filename_only_payload = { file : string; message : string }

type t =
  [ `With_full_location of full_location_payload ]

val make :
  ?suggestion:string ->
  ('a, Format.formatter, unit, Location_.span -> t) format4 ->
  'a

val to_string : t -> string

type 'a with_warnings = { value : 'a; warnings : t list }

type warning_accumulator = t list ref

val accumulate_warnings : (warning_accumulator -> 'a) -> 'a with_warnings

val warning : warning_accumulator -> t -> unit