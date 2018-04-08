tests
testScriptLabelGenerateAnchor
	| item |
	item := (PRCodeblock content: 'foo')
		label: 'myScript';
		yourself.
	self assert: (self write: item) isEmpty