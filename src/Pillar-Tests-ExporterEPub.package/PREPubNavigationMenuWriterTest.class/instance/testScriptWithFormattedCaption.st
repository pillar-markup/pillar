tests
testScriptWithFormattedCaption
	| item |
	item := (PRCodeblock content: 'bar')
		caption: '""foo""';
		yourself.
	self assert: (self write: item) isEmpty