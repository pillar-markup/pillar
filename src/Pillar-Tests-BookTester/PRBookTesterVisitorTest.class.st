Class {
	#name : #PRBookTesterVisitorTest,
	#superclass : #PRBookTestEnvironmentTest,
	#instVars : [
		'testingFileSystem'
	],
	#category : #'Pillar-Tests-BookTester'
}

{ #category : #'tests - examples' }
PRBookTesterVisitorTest >> parseAndTest: docText [
	| doc bTester |
	doc := PRPillarParser new parse: docText.
	bTester := PRBookTesterVisitor new.
	bTester start: doc.
	^ bTester
]

{ #category : #running }
PRBookTesterVisitorTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	
	super setUp.
	testingFileSystem := FileSystem memory workingDirectory.
	(testingFileSystem / self class pillarFileNameForTest)
		writeStreamDo: [ :stream |
			stream nextPutAll: self class pillarContentsForTest ].

]

{ #category : #'tests - examples' }
PRBookTesterVisitorTest >> testExampleCodeblock [
	
	| docText bTester |
	docText := '[[[example=true
3 + 4 
>>> 7
]]]
'.
	bTester := self parseAndTest: docText.
	self assert: bTester failedTests isEmpty.
	self assert: bTester validTests size equals: 1.
]

{ #category : #'tests - examples' }
PRBookTesterVisitorTest >> testExampleCodeblockWithFailingTest [
	
	| docText bTester |
	docText := '[[[example=true
3 + ''12''
>>> 8		
]]]
'.
	bTester := self parseAndTest: docText.
	self assert: bTester validTests isEmpty.
	self assert: bTester failedTests size equals: 1.
]

{ #category : #'tests - examples' }
PRBookTesterVisitorTest >> testExampleCodeblockWithFalseTest [
	
	| docText bTester |
	docText := '[[[example=true
3 + 4 
>>> 8		
]]]
'.
	bTester := self parseAndTest: docText.
	self assert: bTester validTests isEmpty.
	self assert: bTester failedTests size equals: 1.
]

{ #category : #'tests - examples' }
PRBookTesterVisitorTest >> testExampleCodeblockWithNoBrakets [
	
	| docText bTester |
	docText := '[[[example=true
3 + 12	
]]]
'.
	bTester := self parseAndTest: docText.
	self assert: bTester validTests isEmpty.
	self assert: bTester failedTests size equals: 1.
]

{ #category : #'tests - examples' }
PRBookTesterVisitorTest >> testExampleCodeblockWithTwoBrackets [
	
	| docText bTester |
	docText := '[[[example=true
3 + 12
>> 15
]]]
'.
	bTester := self parseAndTest: docText.
	self assert: bTester validTests isEmpty.
	self assert: bTester failedTests size equals: 1.
]

{ #category : #'tests - examples' }
PRBookTesterVisitorTest >> testExpectedFailureForAFailure [

	| docText bTester |
	docText := 
'[[[example=true|expectedFailure=true
3 + 4 
>>> 12		
]]]
'.
	bTester := self parseAndTest: docText.
	self assert: bTester failedTests isEmpty.
	self assert: bTester validTests size equals: 1.
]

{ #category : #'tests - examples' }
PRBookTesterVisitorTest >> testExpectedFailureForARaisedException [

	| docText bTester |
	docText := 
'[[[example=true|expectedFailure=true
3 + ''a'' 
>>> 12		
]]]
'.
	bTester := self parseAndTest: docText.
	self assert: bTester failedTests isEmpty.
	self assert: (bTester validTests size) equals: 1.
]

{ #category : #'tests - explanation' }
PRBookTesterVisitorTest >> testExplanationIsExceptionCatchedInFailingTest [
	
	| docText doc bTester |
	docText := '[[[example=true
3 + ''12''
>>> 8		
]]]
'.
	doc := PRPillarParser new parse: docText.
	bTester := PRBookTesterVisitor new.
	bTester start: doc. 
	self assert: bTester validTests isEmpty.
	self assert: bTester failedTests size equals: 1.
	self assert: bTester failedTests first explanation 
		  equals: 'MessageNotUnderstood: Character>> #adaptToNumber:andSend:'.
]

{ #category : #'tests - explanation' }
PRBookTesterVisitorTest >> testExplanationIsTestFailedWithoutException [
	
	| docText doc bTester |
	docText := '[[[example=true
3 + 13
>>> 15		
]]]
'.
	doc := PRPillarParser new parse: docText.
	bTester := PRBookTesterVisitor new.
	bTester start: doc. 
	self assert: bTester validTests isEmpty.
	self assert: bTester failedTests size equals: 1.
	self assert: bTester failedTests first explanation equals: 'Test failed without raising an exception'.
]

{ #category : #'tests - explanation' }
PRBookTesterVisitorTest >> testExplanationIsTestPassed [
	
	| docText doc bTester |
	docText := '[[[example=true
3 + 12
>>> 15		
]]]
'.
	doc := PRPillarParser new parse: docText.
	bTester := PRBookTesterVisitor new.
	bTester start: doc. 
	self assert: bTester validTests size equals: 1.
	self assert: bTester failedTests isEmpty.
	self assert: bTester validTests first explanation equals: 'Test passed'.
]

{ #category : #'Please FIX ME' }
PRBookTesterVisitorTest >> testLoaderAnnotationLoadsPackageChapter1 [

	| doc bookTester |
	self skip.
	"check method: visitLoaderAnnotation: in bookTester to fix"
	SystemVersion current major < 7 ifTrue: [ ^ self skip ].
	doc := PRDocument new
				add:
				(PRLoaderAnnotation new
					parameterAt: 'account' put: 'QDucasse';
					parameterAt: 'project' put: 'MetacelloTestBook-Code';
					parameterAt: 'tag' put: 'Chapter1';
					parameterAt: 'baseline' put: 'MetacelloTestBook';
				yourself); 
			yourself.
	"Pay attention that here the values should really be the values as created by the ${publications:... parser}$"
	bookTester := PRBookTesterVisitor new.
	bookTester start: doc.
	"The loaded code contains a new class Plop with the method chapterOne returning 'chapterOne'"
	self assert: (self class environment keys includes: #Plop).
	self assert: (self class environment at: #Plop) new chapterOneMethod equals: 'chapterOne'


	
	
	
	
]

{ #category : #'Please FIX ME' }
PRBookTesterVisitorTest >> testLoaderAnnotationLoadsPackageChapter2 [
	| doc bookTester|
	self skip.
	"check method: visitLoaderAnnotation: in bookTester to fix"
	SystemVersion current major < 7 ifTrue: [ ^ self skip ].
	doc := PRDocument new
				add:
				(PRLoaderAnnotation new
					parameterAt: 'account' put: 'QDucasse';
					parameterAt: 'project' put: 'MetacelloTestBook-Code';
					parameterAt: 'tag' put: 'Chapter2';
					parameterAt: 'baseline' put: 'MetacelloTestBook';
				yourself); 
			yourself.
	"Pay attention that here the values should really be the values as created by the ${publications:... parser}$"
	bookTester := PRBookTesterVisitor new.
	bookTester start: doc.
	"The loaded code contains a new class Plop with the method chapterOne returning 'chapterOne'"
	self assert: (self class environment keys includes: #Plop).
	self assert: (self class at: #Plop) new chapterOneMethod equals: 'chapterOne'.
	self assert: (self class at: #Plop) new chapterTwoMethod equals: 'chapterTwo'
	
	
	
]

{ #category : #'Please FIX ME' }
PRBookTesterVisitorTest >> testLoaderAnnotationLoadsPackageChapter3 [
	| doc bookTester|
	self skip.
	"check method: visitLoaderAnnotation: in bookTester to fix"
	SystemVersion current major < 7 ifTrue: [ ^ self skip ].
	
	doc := PRDocument new
				add:
				(PRLoaderAnnotation new
					parameterAt: 'account' put: 'QDucasse';
					parameterAt: 'project' put: 'MetacelloTestBook-Code';
					parameterAt: 'tag' put: 'Chapter3';
					parameterAt: 'baseline' put: 'MetacelloTestBook';
				yourself); 
			yourself.
	"Pay attention that here the values should really be the values as created by the ${publications:... parser}$"
	bookTester := PRBookTesterVisitor new.
	bookTester start: doc.
	"The loaded code contains a new class Plop with the method chapterOne returning 'chapterOne'"
	self assert: (self class environment keys includes: #Plop).
	self assert: (self class at: #Plop) new chapterOneMethod equals: 'chapterThree'.
	self assert: (self class at: #Plop) new chapterTwoMethod equals: 'chapterTwo'.
	self assert: (self class at: #Plop) new chapterThreeMethod equals: 'chapterThree'
]

{ #category : #'tests - examples' }
PRBookTesterVisitorTest >> testNoExampleCodeblock [

	| docText bTester |
	docText := 
'[[[
3 + 4 
>>> 7		
]]]
'.
	bTester := self parseAndTest: docText.
	self assert: bTester failedTests isEmpty.
	self assert: bTester validTests isEmpty.
]

{ #category : #'tests - examples' }
PRBookTesterVisitorTest >> testThreeCodeBlocksWithTwoExamples [

	| docText bTester |
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
	bTester := self parseAndTest: docText.
	self assert: bTester failedTests size equals: 1.
	self assert: bTester validTests size equals: 1.
]

{ #category : #'test - virtual file' }
PRBookTesterVisitorTest >> testVirtualFileSystem [

	| bTester |
	bTester := PRBookTesterVisitor new.
	bTester workingDirectory: testingFileSystem.
	bTester checkAndReportFileNamed: self class pillarFileNameForTest.
	self assert: bTester failedTests size equals: 4.
	self assert: bTester validTests size equals: 2.
]
