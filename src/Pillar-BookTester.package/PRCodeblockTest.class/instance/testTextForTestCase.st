tests
testTextForTestCase

	| cb |
	cb := PRCodeblock content:'3+4
>>> 7'parameters: (OrderedDictionary newFromKeys: #('testcase') andValues: #(true)).
	self assert: cb textForTestcase equals: '(3+4)>>>7'