Class {
	#name : #PRShowClassTransformerTest,
	#superclass : #PRTransformerEnvironmentTest,
	#category : 'Pillar-BookTester-Annotations-Tests'
}

{ #category : #private }
PRShowClassTransformerTest >> actualClass [
	^ PRShowClassTransformer 
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
	| doc codeblock |
	doc := PRDocument new
				add:
				(PRShowClassAnnotation new
					parameterAt: 'class' put: 'Integer';
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
	self assert: codeblock text equals: Integer definition.

	
	
]

{ #category : #running }
PRShowClassTransformerTest >> testTransformerCreatesClassDefinitionForUnknownClass [
	| doc codeblock |
	doc := PRDocument new
				add:
				(PRShowClassAnnotation new
					parameterAt: 'class' put: 'IntegRR';
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
	self assert: codeblock text equals: 'The system was looking for IntegRR but did not find it'.

	
	
]
