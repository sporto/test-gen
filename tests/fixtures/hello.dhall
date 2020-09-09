let Test = \(input: Type) -> \(expected : Type) →
	{
		it: Text,
		input: input,
		expected: expected,
	}

-- let Describe: Type =
-- 	{
-- 		describe: Text,
-- 		its: List Test,
-- 	}

-- let DescribeOrTest = < Describe: Describe | Test: Test >

let Subject = \(input: Type) -> \(out : Type) ->
	{
		entry : Text,
		tests: List (Test input out),
	}

let describeLen : List (Subject Text Integer) = [
	{
		entry = "len",
		tests =
			[
				{ it = "returns the len", input = "Hello", expected = +5 },
				{ it = "returns the len", input = "", expected = +0 },
			]
	},
]

let describeHello : List (Subject Text Text) = [
	{
		entry = "hello",
		tests =
			[
				{ it = "answers", input = "", expected = "Hello" },
				{ it = "has the given name", input = "Sam", expected = "Hello Sam" },
			]
	},
]

let suite =
	[
		describeLen,
	]

-- Add describe (group its)
-- Add multiple assertions
-- Add inputs for test

in suite