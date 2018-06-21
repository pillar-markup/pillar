running
testPrettyRename

	| testGenerator |
	testGenerator := PRBookTestGenerator new.
	self assert: (testGenerator prettyRename: '/usr/Users/Library/test.pillar') 
		  equals: 'Test'.