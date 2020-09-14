let Assert = < Equals >

let Fun1 =
	\(inputType: Type) ->
	\(outputType: Type) ->
	{ _1 : { input : inputType }
	, assertion : Assert
	, output : outputType
	}

let Fun2 =
	\(input1Type: Type) ->
	\(input2Type: Type) ->
	\(outputType: Type) ->
	{ _1 : { input : input1Type }
	, _2 : { input : input2Type }
	, assertion : Assert
	, output : outputType
	}

let fun1 =
	\(input1Type: Type) ->
	\(outputType: Type) ->
	\(input1 : input1Type) ->
	\(assertion : Assert) ->
	\(output : outputType) ->
	{ _1 = { input = input1 }
	, assertion = assertion
	, output = output
	}

let Describe1 =
	\(input1Name: Type) ->
	\(outputType: Type) ->
	{ functionName : Text
	, arg1Name : Text
	, tests : List (Fun1 input1Name outputType)
	}

let describe1 =
	\(name: Text) ->
	\(input1Name: Text) ->
	\(input1Type: Type) ->
	\(outputType: Type) ->
	\(tests: List (Fun1 input1Type outputType)) ->
	{ functionName = name
	, arg1Name = input1Name
	, tests = tests
	}

--

let len  =
	fun1 Text Integer

let lenTests : Describe1 Text Integer =
	describe1 "len" "input1" Text Integer
		[ len "hello" Assert.Equals +5
		, len "" Assert.Equals +0
		]

let Function = < Len : Describe1 Text Integer >

let suite : List Function = [
	Function.Len lenTests
]

in suite