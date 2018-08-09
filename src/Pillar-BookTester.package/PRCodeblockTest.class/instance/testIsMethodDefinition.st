tests
testIsMethodDefinition

	| cb1 cb2 |
	cb1 := PRCodeblock content:'MethodClassName >> methodName
methodBody'
						   parameters: (OrderedDictionary newFromKeys: #('methodDefinition') andValues: #(true)).
	self assert: cb1 isMethodDefinition.