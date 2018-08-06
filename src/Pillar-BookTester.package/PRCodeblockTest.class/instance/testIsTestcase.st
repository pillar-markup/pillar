tests
testIsTestcase

	| cb1 cb2 |
	cb1 := PRCodeblock content:'3+4
>>>7'
						   parameters: (OrderedDictionary newFromKeys: #('testcase') andValues: #(true)).
	self assert: cb1 isExample.
	
	

	