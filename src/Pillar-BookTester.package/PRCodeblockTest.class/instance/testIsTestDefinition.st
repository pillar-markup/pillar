tests
testIsTestDefinition

	| cb1 cb2 |
	cb1 := PRCodeblock content:'TestClassName >> testMethodName
testBody'
						   parameters: (OrderedDictionary newFromKeys: #('testDefinition') andValues: #(true)).
	self assert: cb1 isTestDefinition.