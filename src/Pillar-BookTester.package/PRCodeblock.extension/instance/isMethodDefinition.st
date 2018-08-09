*Pillar-BookTester
isMethodDefinition
	"a codeblock may be a method definition. It does not need to be be methodDefinition=true, methodDefinition alone is enough.
	
	[[[methodDefinition
			
	]]]
	"
	
	^ (self hasParameter: 'methodDefinition')