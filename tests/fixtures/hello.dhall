let Test = \(input: Type) -> \(expected : Type) →
	{
		it: Text,
		input: input,
		expected: expected,
	}

let len : List (Test Text Integer) =
	[
		{ it = "returns the len", input = "Hello", expected = +5 },
		{ it = "returns the len", input = "", expected = +0 },
	]

let hello : List (Test Text Text) =
	[
		{ it = "answers", input = "", expected = "Hello" },
		{ it = "has the given name", input = "Sam", expected = "Hello Sam" },
	]

let parseInt : List (Test Text (Optional Integer)) =
	[
		{ it = "parses", input = "12", expected = Some +12 },
		{ it = "can fail", input = "A1", expected = None Integer },
	]

let chars : List (Test Text (List Text)) =
	[
		{ it = "returns the characters", input = "ABC", expected = [ "A", "B", "C"] }
	]

let areas : List (Test {h: Integer, w: Integer} Integer) =
	[
		{ it = "gets the area", input = { h = +10, w = +20 }, expected = +200 }
	]

let suite =
	{
		len = len,
		hello = hello,
		parseInt = parseInt,
		chars = chars,
		areas = areas,
	}

in suite