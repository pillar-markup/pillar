tests - examples
testThreeCodeBlocksWithTwoExamples

	| docText doc bTester |
	docText := 
'[[[example=true
3 + 4 
>>> 7		
]]]

[[[example=true
3 + 4 
>>> 8
]]]

[[[
3 + ''4'' 
>>> 7		
]]]
'.
	doc := PRPillarParser new parse: docText.
	bTester := PRBookTesterVisitor new.
	bTester start: doc. 
	self assert: bTester failedTests size equals: 1.
	self assert: bTester validTests size equals: 1.