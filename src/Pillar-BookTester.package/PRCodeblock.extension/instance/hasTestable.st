*Pillar-BookTester
hasTestable
	"a code may be testable annotation. It does not need to be be testable=true, testable alone is enough.
	
	[[[testable 
			
	]]]
	"
	
	^ (self hasParameter: 'testable')