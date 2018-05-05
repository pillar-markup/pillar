tests
testParseWithInterpretation
	| input expected |
	input := '${mock:Foo|number=5}$'.
	expected := PRMockAnnotation new.
	expected parameters
		at: 'value' put: 'Foo';
		at: 'number' put: 5.
	self
		assert:
			(PRDocument parser parse: input startingAt: #annotation)
		equals: expected