let Assert = < Equals >

let assertToCode =
	\(assertion: Assert) ->
	merge
		{
			Equals = "equals"
		}
		assertion

let Test1 =
	\(inputType: Type) ->
	\(outputType: Type) ->
	{ arg1 : inputType
	, assertion : Text
	, output : outputType
	}

let Test2 =
	\(input1Type: Type) ->
	\(input2Type: Type) ->
	\(outputType: Type) ->
	{ arg1 : input1Type
	, arg2 : input2Type
	, assertion : Text
	, output : outputType
	}

let test1 =
	\(input1Type: Type) ->
	\(outputType: Type) ->
	\(input1 : input1Type) ->
	\(assertion : Assert) ->
	\(output : outputType) ->
	{ arg1 = input1
	, assertion = assertToCode assertion
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
	test1 Text Integer

let lenTests : Describe1 Text Integer =
	describe1 "len" "input1" Text Integer
		[ len "hello" Assert.Equals +5
		, len "" Assert.Equals +0
		]

let parseInt =
	test1 Text (Optional Integer)

let parseIntTests =
	describe1 "parseInt" "input" Text (Optional Integer)
		[ parseInt "1" Assert.Equals (Some +1)
		, parseInt "x" Assert.Equals (None Integer)
		]

in
	{
		suiteName = "suite",
		_1 = lenTests,
		_2 = parseIntTests,
	}