tests
testScriptLabelGenerateAnchor
	| item |
	item := (PRCodeblock content: 'foo')
		label: 'myScript';
		yourself.
	self
		assertWriting: item
		includesTexts:
			{(self scriptAnchorForMyScript).
			'myScript'}