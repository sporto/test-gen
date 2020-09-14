let Assert = < Equals >

let Test1 =
	\(inputType: Type) ->
	\(outputType: Type) ->
	{ arg1 : inputType
	, assertion : Assert
	, output : outputType
	}

let Test2 =
	\(input1Type: Type) ->
	\(input2Type: Type) ->
	\(outputType: Type) ->
	{ arg1 : input1Type
	, arg2 : input2Type
	, assertion : Assert
	, output : outputType
	}

let fun1 =
	\(input1Type: Type) ->
	\(outputType: Type) ->
	\(input1 : input1Type) ->
	\(assertion : Assert) ->
	\(output : outputType) ->
	{ arg1 = input1
	, assertion = assertion
	, output = output
	}

let Describe1 =
	\(input1Name: Type) ->
	\(outputType: Type) ->
	{ functionName : Text
	, arg1Name : Text
	, tests : List (Test1 input1Name outputType)
	}

let describe1 =
	\(name: Text) ->
	\(input1Name: Text) ->
	\(input1Type: Type) ->
	\(outputType: Type) ->
	\(tests: List (Test1 input1Type outputType)) ->
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