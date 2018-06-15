tests
testEverythingThreeCodeBlocksWithTwoTestables

	| docText doc bTester |
	docText := 
'[[[testable
3 + 4 
>>> 7		
]]]

[[[testable
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
	bTester reportAllCodeBlocks.
	bTester start: doc. 
	self assert: bTester failedTests size equals: 2.
	self assert: bTester validTests size equals: 1.