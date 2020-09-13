let fun1 =
	\(inputType: Type) ->
	{ name : Text, _1 : { name : Text, input : inputType } }

let call1 =
	\(name: Text) ->
	\(in1Name: Text) ->
	\(inputType: Type) ->
	\(in1: inputType) ->
	{ name = name, _1 = { name = in1Name, input = in1 } }

let Len : Type =
	fun1 Text

let len =
	call1 "len" "input" Text

let lenTests =
	[ len "hello" ]

let Function = < Len : List Len >

let suite : List Function = [
	Function.Len lenTests
]

in suite