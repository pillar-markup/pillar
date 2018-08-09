*Pillar-BookTester
isExpectedFailure
	"a codeblock may be an expected failure, you can state it by using the parameter as follows
	
	[[[expectedFailure=true
			
	]]]
	"
	
	^ (self hasParameter: 'expectedFailure')