tests
testParseWithoutARequiredParameter
	| input |
	input := '${mock}$'.
	self should: [ PRDocument parser parse: input ] raise: PRError