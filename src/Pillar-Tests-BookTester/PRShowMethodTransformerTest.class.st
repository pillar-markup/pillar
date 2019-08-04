Class {
	#name : #PRShowMethodTransformerTest,
	#superclass : #PRTransformerEnvironmentTest,
	#category : #'Pillar-Tests-BookTester'
}

{ #category : #private }
PRShowMethodTransformerTest >> actualClass [
	^ PRShowMethodTransformer 
]

{ #category : #running }
PRShowMethodTransformerTest >> help: classString method: methodString result: aString [
	| doc codeblock |
	doc := PRDocument new
				add:
				(PRShowMethodAnnotation new
					parameterAt: 'class' put: classString;
					parameterAt: 'method' put: methodString;
				yourself); 
			yourself.
	"Pay attention that here the values should really be the values as created by the ${publications:... parser}$"
	((PRShowMethodTransformer withContext: (PRProject on: testingFileSystem )) start: doc).
	codeblock := doc children first.
	"Then, let's test that a codeblock has been added to the document"
	self assert: codeblock class equals: PRCodeblock.
	self assert: codeblock parameters equals: 
				(OrderedDictionary new
					add: 'methodDefinition' -> true;
					yourself).
	self assert: codeblock text equals: aString.

	
	
]

{ #category : #running }
PRShowMethodTransformerTest >> setUp [

	super setUp.
	testingFileSystem := FileSystem memory workingDirectory.
	(testingFileSystem / PRTransformerEnvironmentTest pillarAnnotationsFileNameForTest)
		writeStreamDo: [ :stream | 
			stream nextPutAll: PRTransformerEnvironmentTest pillarAnnotationsContentsForTest ]
]

{ #category : #running }
PRShowMethodTransformerTest >> testTransformerCreatesMethodDefinitionCodeblock [

	self help: 'Integer' method: 'isPowerOfTwo' result: 'Integer >> ',(Integer compiledMethodAt: #isPowerOfTwo) sourceCode
	


]

{ #category : #running }
PRShowMethodTransformerTest >> testTransformerCreatesMethodDefinitionFromUnknownClass [

	self help: 'IntegRR' method: 'isPowerOfTwo' result: 'The system was looking for IntegRR but did not find it'
	

	
]

{ #category : #running }
PRShowMethodTransformerTest >> testTransformerCreatesMethodDefinitionFromUnknownMethod [
	self help: 'Integer' method: 'isPowerOfTweuuu' result: 'The system was looking for Integer but did not find the method isPowerOfTweuuu'
	
	
]
