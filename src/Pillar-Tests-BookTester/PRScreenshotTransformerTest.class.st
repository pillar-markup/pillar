Class {
	#name : #PRScreenshotTransformerTest,
	#superclass : #PRTransformerEnvironmentTest,
	#category : #'Pillar-Tests-BookTester'
}

{ #category : #running }
PRScreenshotTransformerTest >> actualClass [
	^ PRScreenshotTransformer 
]

{ #category : #running }
PRScreenshotTransformerTest >> setUp [

	super setUp.
	testingFileSystem := FileSystem memory workingDirectory.
	(testingFileSystem / PRTransformerEnvironmentTest pillarAnnotationsFileNameForTest)
		writeStreamDo: [ :stream | 
			stream nextPutAll: PRTransformerEnvironmentTest pillarAnnotationsContentsForTest ].
	((FileLocator image / 'figures') isFile)
		ifFalse: [ (FileLocator imageDirectory / 'figures') ensureCreateDirectory ].

]

{ #category : #running }
PRScreenshotTransformerTest >> testTransformerCreatesFigureReference [
	"It is needed to create the subfolder image/YourImage/figures as if it was a book in order for these tests to work"
	| doc figure |
	
	SystemVersion current major < 7 ifTrue: [ ^ self skip ].
	
	doc := PRDocument new
				add:
				(PRScreenshotAnnotation new
					parameterAt: 'class' put: 'Integer';
					parameterAt: 'method' put: 'isPowerOfTwo';
					parameterAt: 'caption' put: 'The method determining if an integer is a power of two';
					parameterAt: 'width' put: '50';
					parameterAt: 'label' put: 'times2';
				yourself); yourself.
	"Pay attention that here the values should really be the values as created by the ${publications:... parser}$"
	((PRScreenshotTransformer withContext: (PRProject on: testingFileSystem)) start: doc).
	figure := doc children first.
	"Let's test that a figure reference has been added to the document with the correct parameters"
	self assert: figure class equals: PRFigure.
	self assert: figure hasCaption.
	self assert: figure hasLabel.
	self assert: figure parameters equals: 
				(OrderedDictionary new
					add: 'width' -> 50;
					add: 'label' -> 'times2'; 
					yourself).

	
	
]

{ #category : #running }
PRScreenshotTransformerTest >> testTransformerCreatesFile [
	"The test may fail if launched at a when changing minutes if you are unlucky"
	| doc dateStamp |
	
	SystemVersion current major < 7 ifTrue: [ ^ self skip ].
	
	doc := PRDocument new
				add:
				(PRScreenshotAnnotation new
					parameterAt: 'class' put: 'Integer';
					parameterAt: 'method' put: 'isPowerOfTwo';
					parameterAt: 'caption' put: 'The method determining if an integer is a power of two';
					parameterAt: 'width' put: '50';
					parameterAt: 'label' put: 'times2';
				yourself); yourself.
	dateStamp := (String streamContents:
					[ :s | s << 'Integer_isPowerOfTwo'. 
						    s << (('-', ((DateAndTime year: (DateAndTime now year) 
											       month: (DateAndTime now month) 
											       day: (DateAndTime now dayOfMonth)
													 hour: (DateAndTime now hour)
												    minute: (DateAndTime now minute))
										asString splitOn:(DateAndTime now minute) asString) first) copyReplaceAll: ':' with: '-').
							s << '*']).
						    
	((PRScreenshotTransformer withContext: (PRProject on: testingFileSystem )) start: doc).
	self assert: (FileSystem workingDirectory / 'figures' / 'screenshots')  hasChildren.
	self deny: ((FileSystem workingDirectory / 'figures' / 'screenshots')  childrenMatching: dateStamp) isEmpty.
	
]
