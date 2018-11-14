tests
testIsExpectedFailure

	| cb1 |
	cb1 := PRCodeblock content:'3+4
>>>7'
						   parameters:  (OrderedDictionary newFromPairs: { 'expectedFailure' . true }).
	self assert: cb1 isExpectedFailure.
	
	

	