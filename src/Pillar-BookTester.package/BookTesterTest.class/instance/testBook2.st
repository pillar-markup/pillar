tests
testBook2

	| docText doc |
	docText := '! A test 
	
[[[testable=true 
3 + 4 
>>> 8		
]]]
'.
	doc := PRPillarParser new parse: docText.
	PRBookTesterVisitor new start: doc.