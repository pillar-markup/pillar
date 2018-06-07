tests
testBook

	| docText doc |
	docText := '! A test 
	
[[[testable=true 
3 + 4 
>>> 7		
]]]
'.
	doc := PRPillarParser new parse: docText.
	PRBookTesterVisitor new start: doc.