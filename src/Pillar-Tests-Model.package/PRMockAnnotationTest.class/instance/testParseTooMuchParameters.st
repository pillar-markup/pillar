tests
testParseTooMuchParameters
	| input  |
	input := '${mock:Foo|option=bar}$'.
	self should: [ PRDocument parser parse: input ] raise: PRWarning