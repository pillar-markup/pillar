tests - Script
testScript
	super testScript.
	self assert: result equals: (PRCodeblock content: 'foo').
	self assertStart: 1 stop: 11.