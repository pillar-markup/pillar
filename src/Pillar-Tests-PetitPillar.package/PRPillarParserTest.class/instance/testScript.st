tests - Script
testScript
	super testScript.
	self assert: result equals: (PRScript content: 'foo')