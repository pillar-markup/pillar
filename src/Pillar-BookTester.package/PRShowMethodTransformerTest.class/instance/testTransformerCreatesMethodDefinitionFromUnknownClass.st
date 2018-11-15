running
testTransformerCreatesMethodDefinitionFromUnknownClass
	| doc codeblock |
	doc := PRDocument new
				add:
				(PRShowMethodAnnotation new
					parameterAt: 'class' put: 'IntegRR';
					parameterAt: 'method' put: 'isPowerOfTwo';
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
	self assert: codeblock text equals: 'The system was looking for IntegRR but did not find it'

	
	