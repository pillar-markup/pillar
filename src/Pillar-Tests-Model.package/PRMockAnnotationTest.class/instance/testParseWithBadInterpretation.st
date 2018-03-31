tests
testParseWithBadInterpretation
	| input |
	input := '${mock:Foo|number=cinq}$'.
	self should: [ PRDocument parser parse: input ] raise: Error