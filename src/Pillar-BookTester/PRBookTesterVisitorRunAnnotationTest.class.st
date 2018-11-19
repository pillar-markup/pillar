Class {
	#name : #PRBookTesterVisitorRunAnnotationTest,
	#superclass : #PRBookTesterVisitorTest,
	#category : 'Pillar-BookTester-Visitor-Tests'
}

{ #category : #running }
PRBookTesterVisitorRunAnnotationTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	
	super setUp.
	PRBookTestDummyRunAnnotation methods do: [ :each | each removeFromSystem ].
	testingFileSystem := FileSystem memory workingDirectory.
	(testingFileSystem / self class pillarFileNameForTest)
		writeStreamDo: [ :stream |
			stream nextPutAll: self class pillarContentsForTest ].

]

{ #category : #running }
PRBookTesterVisitorRunAnnotationTest >> tearDown [
	"Hooks that subclasses may override to define the fixture of test."
	
	PRBookTestDummyRunAnnotation methods do: [ :each | each removeFromSystem ]

]

{ #category : #'tests-annotations' }
PRBookTesterVisitorRunAnnotationTest >> testRunAnnotationReportFailingTests [
	| doc docText bookTester|

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

	
	
	
]

{ #category : #'tests-annotations' }
PRBookTesterVisitorRunAnnotationTest >> testRunAnnotationReportGreenTests [
	| doc docText bookTester|
	docText := '
[[[methodDefinition=true
PRBookTestDummyRunAnnotation>>test1
	self assert: 1+1 equals: 2
]]]

[[[methodDefinition=true
PRBookTestDummyRunAnnotation>>methodTest2
	^ ''test2''
]]]

[[[methodDefinition=true
PRBookTestDummyRunAnnotation>>test2
	self assert: self methodTest2 equals: ''test2''
]]]

${run:testClass=PRBookTestDummyRunAnnotation}$'. 
	doc := PRPillarParser new parse: docText.
	bookTester := PRBookTesterVisitor new.
	bookTester start: doc.
	"The loaded code contains a new class Plop with the method chapterOne returning 'chapterOne'"
	self assert: (PRBookTestDummyRunAnnotation methodDict keys includes: #methodTest2).
	self assert: (PRBookTestDummyRunAnnotation methodDict keys includes: #test1).
	self assert: (PRBookTestDummyRunAnnotation methodDict keys includes: #test2).
	self assert: bookTester failedTests isEmpty.
	"Three methodDefinition checking the compilation of those three methods + two test methods running"
	self assert: bookTester validTests size equals: 5.

	
	
	
	
]
