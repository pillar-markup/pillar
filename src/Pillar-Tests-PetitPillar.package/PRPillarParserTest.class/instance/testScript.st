tests - Script
testScript
	super testScript.
	self assert: result equals: (PRCodeblock content: 'foo')