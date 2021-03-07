Class {
	#name : #PRShowClassTransformerTest,
	#superclass : #PRTransformerEnvironmentTest,
	#category : #'Pillar-Tests-BookTester'
}

{ #category : #private }
PRShowClassTransformerTest >> actualClass [
	^ PRShowClassTransformer 
]

{ #category : #running }
PRShowClassTransformerTest >> helper: classString result: resultString [
	| doc codeblock |
	doc := PRDocument new
				add:
				(PRShowClassAnnotation new
					parameterAt: 'class' put: classString;
				yourself); 
			yourself.
	"Pay attention that here the values should really be the values as created by the ${publications:... parser}$"
	((PRShowClassTransformer withContext: (PRProject on: testingFileSystem )) start: doc).
	codeblock := doc children first.
	"Then, let's test that a codeblock has been added to the document"
	self assert: codeblock class equals: PRCodeblock.
	self assert: codeblock parameters equals: 
				(OrderedDictionary new
					add: 'classDefinition' -> true;
					yourself).
	self assert: codeblock text equals: resultString.

	
	
]

{ #category : #running }
PRShowClassTransformerTest >> setUp [

	super setUp.
	testingFileSystem := FileSystem memory workingDirectory.
	(testingFileSystem / PRTransformerEnvironmentTest pillarAnnotationsFileNameForTest)
		writeStreamDo: [ :stream | 
			stream nextPutAll: PRTransformerEnvironmentTest pillarAnnotationsContentsForTest ]
]

{ #category : #running }
PRShowClassTransformerTest >> testTransformerCreatesClassDefinitionCodeblock [
	self skip. 
	self flag: #todo. 
	self helper: 'Integer' result: Integer definitionString
]

{ #category : #running }
PRShowClassTransformerTest >> testTransformerCreatesClassDefinitionForUnknownClass [
	self helper: 'IntegRR' result: 'The system was looking for IntegRR but did not find it'.

	
	
]
