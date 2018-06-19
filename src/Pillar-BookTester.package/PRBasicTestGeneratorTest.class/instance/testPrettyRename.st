running
testPrettyRename

	| testGenerator |
	testGenerator := PRBasicTestGenerator new.
	self assert: (testGenerator prettyRename: '/usr/Users/Library/test.pillar') 
		  equals: 'Test'.