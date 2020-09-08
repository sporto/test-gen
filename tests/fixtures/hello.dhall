let Out = <
		| String : Text
		| Int : Integer
		| Float : Double
		| OptString: Optional Text
		| ListString : List Text
		| ListInt : List Integer
		| ListFloat : List Double
	>

let Test : Type =
	{
		it: Text,
		expected: Out,
	}

let Describe: Type =
	{
		describe: Text,
		its: List Test,
	}

let DescribeOrTest = < Describe: Describe | Test: Test >

let Subject : Type =
	{
		entry : Text,
		returnType : Text,
		tests: List DescribeOrTest,
	}

let config : List Subject = [
	{
		entry = "hello",
		returnType = "string",
		tests =
			[
				DescribeOrTest.Test { it = "answers", expected = Out.String "Hello" },
				DescribeOrTest.Test { it = "has the given name", expected = Out.String "Hello Sam" },
			]
	},
]

-- Add describe (group its)
-- Add multiple assertions
-- Add inputs for test
-- Add different input types
-- Add different output types

in config