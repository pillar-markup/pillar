tests
testIsMethodDefinition

	| cb1 cb2 |
	cb1 := PRCodeblock content:'MethodClassName >> methodName
methodBody'
						   parameters:  (OrderedDictionary newFromPairs: { 'methodDefinition' . true }).
	self assert: cb1 isMethodDefinition.