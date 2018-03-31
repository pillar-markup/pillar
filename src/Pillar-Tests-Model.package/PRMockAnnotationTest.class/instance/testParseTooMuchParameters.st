tests
testParseTooMuchParameters
	| input |
	input := '${mock:Foo|option=bar}$'.
	self should: [ PRDocument parser parse: input ] raise: PRError.
	input := '${mock:Foo|option=bar|toto=4}$'.
	self should: [ PRDocument parser parse: input ] raise: PRError.
	input := '${mock|option=bar}$'.
	self should: [ PRDocument parser parse: input ] raise: PRError.