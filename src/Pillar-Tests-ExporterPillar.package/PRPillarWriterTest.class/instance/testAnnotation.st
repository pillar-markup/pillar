tests
testAnnotation
	| item |
	item := PRMockAnnotation withParameters:
				(OrderedDictionary new
					add: 'value' -> 'Foo';
					add: 'number' -> '5';
					yourself).
	self assertWriting: item includesText: '${mock:value=Foo|number=5}$'