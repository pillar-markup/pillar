*Pillar-BookTester
isClassDefinition
	"a codeblock may be a class definition. It does not need to be be classDefinition=true, classDefinition alone is enough.
	
	[[[classDefinition
			
	]]]
	"
	
	^ (self hasParameter: 'classDefinition')