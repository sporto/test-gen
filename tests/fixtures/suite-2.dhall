let Assert = < Equals >

let Fun1 =
	\(inputType: Type) ->
	\(outputType: Type) ->
	{ name : Text
	, _1 : { name : Text, input : inputType }
	, assertion : Assert
	, output : outputType
	}

let Fun2 =
	\(input1Type: Type) ->
	\(input2Type: Type) ->
	\(outputType: Type) ->
	{ name : Text
	, _1 : { name : Text, input : input1Type }
	, _2 : { name : Text, input : input2Type }
	, assertion : Assert
	, output : outputType
	}

let fun1 =
	\(name: Text) ->
	\(input1Name: Text) ->
	\(input1Type: Type) ->
	\(outputType: Type) ->
	\(input1 : input1Type) ->
	\(assertion : Assert) ->
	\(output : outputType) ->
	{ name = name
	, _1 = { name = input1Name, input = input1 }
	, assertion = assertion
	, output = output
	}

let len =
	fun1 "len" "input" Text Integer

let lenTests =
	[ len "hello" Assert.Equals +5
	, len "" Assert.Equals +0
	]

let Function = < Len : List (Fun1 Text Integer) >

let suite : List Function = [
	Function.Len lenTests
]

in suite