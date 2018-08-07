tests
testAnnotation
	| item |
	item := PRMockAnnotation withParameters: (
					PRParameters withAll: { 
						PRParameter 
							keyNode: (PRParameterKey named: 'value')
							valueNode: (PRParameterValue value: 'Foo').
						PRParameter 
							keyNode: (PRParameterKey named: 'number')
							valueNode: (PRParameterValue value: 5) }).
	self assertWriting: item includesText: '${mock:value=Foo|number=5}$'