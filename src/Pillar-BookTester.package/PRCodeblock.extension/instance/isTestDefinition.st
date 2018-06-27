*Pillar-BookTester
isTestDefinition
	"a codeblock may be a test definition. It does not need to be be testDefinition=true, testDefinition alone is enough.
	
	[[[testDefinition
			
	]]]
	"
	
	^ (self hasParameter: 'testDefinition')