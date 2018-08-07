tests
testParseWithInterpretation
	| input expected |
	input := '${mock:value=Foo|number=5}$'.
	expected := PRMockAnnotation withParameters: (
		PRParameters withAll: { 
			PRParameter 
				keyNode: (PRParameterKey named: 'value')
				valueNode: (PRParameterValue value: 'Foo').
			PRParameter 
				keyNode: (PRParameterKey named: 'number')
				valueNode: (PRParameterValue value: 5) }).
	self
		assert:
			(PRDocument parser parse: input startingAt: #annotation)
		equals: expected