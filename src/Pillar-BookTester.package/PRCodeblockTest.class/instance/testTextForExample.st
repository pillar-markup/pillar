tests
testTextForExample

	| cb |
	cb := PRCodeblock content:'3+4
>>> 7'parameters: (OrderedDictionary newFromKeys: #('testcase') andValues: #(true)).
	self assert: cb textForExample equals: '(3+4)>>>7'