tests
testIsTestDefinition

	| cb1 |
	cb1 := PRCodeblock content:'TestClassName >> testMethodName
testBody'
						   parameters:  (OrderedDictionary newFromPairs: { 'testDefinition' . true }).
	self assert: cb1 isTestDefinition.