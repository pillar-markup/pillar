tests-annotations
testRunAnnotationReportFailingTests
	| doc docText bookTester|
	PRBookTestDummyRunAnnotation methodDict removeAll.
	docText := '
[[[methodDefinition=true
PRBookTestDummyRunAnnotation>>test1
	self assert: 1+1 equals: 3
]]]

[[[methodDefinition=true
PRBookTestDummyRunAnnotation>>methodTest2
	^ ''test2''
]]]

[[[methodDefinition=true
PRBookTestDummyRunAnnotation>>test2
	self assert: self methodTest2 equals: ''test2''
]]]

[[[methodDefinition=true
PRBookTestDummyRunAnnotation>>test3
	self assert: self methodTest2 equals: ''test3''
]]]

${run:testClass=PRBookTestDummyRunAnnotation}$'. 
	doc := PRPillarParser new parse: docText.
	bookTester := PRBookTesterVisitor new.
	bookTester start: doc.
	"The loaded code contains a new class Plop with the method chapterOne returning 'chapterOne'"
	self assert: (PRBookTestDummyRunAnnotation methodDict keys includes: #methodTest2).
	self assert: (PRBookTestDummyRunAnnotation methodDict keys includes: #test1).
	self assert: (PRBookTestDummyRunAnnotation methodDict keys includes: #test2).
	self assert: (PRBookTestDummyRunAnnotation methodDict keys includes: #test3).
	"Four methodDefinition checking the compilation of those methods + one test method running"
	self assert: bookTester validTests size equals: 5.
	"Two failed tests"
	self assert: bookTester failedTests size equals: 2.

	
	
	
	