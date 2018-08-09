running
testTransformerCreatesClassDefinitionCodeblock
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

	
	