tests
testIsExpectedFailure

	| cb1 |
	cb1 := PRCodeblock content:'3+4
>>>7'
						   parameters: (OrderedDictionary newFromKeys: #('expectedFailure') andValues: #(true)).
	self assert: cb1 isExpectedFailure.
	
	

	