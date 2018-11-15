tests
testIsExample

	| cb1 cb2 |
	cb1 := PRCodeblock content:'3+4
>>>7'
						   parameters:  (OrderedDictionary newFromPairs: { 'example' . true }).
	self assert: cb1 isExample.
	
	

	