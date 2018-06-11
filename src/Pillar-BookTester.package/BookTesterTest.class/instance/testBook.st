tests
testBook

	| docText doc bTester |
	docText := '! A test 
	
[[[testable=true 
3 + 4 
>>> 7		
]]]
'.
	doc := PRPillarParser new parse: docText.
	bTester := PRBookTesterVisitor new.
	(bTester testBook: doc) do: [ :t | self assert: t shouldPass ]

