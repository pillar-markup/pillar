tests
testParseWithWrongValue
	| input |
	input := '${mock:Foo|number=100}$'.
	self should: [PRDocument parser parse: input ] raise: MAError