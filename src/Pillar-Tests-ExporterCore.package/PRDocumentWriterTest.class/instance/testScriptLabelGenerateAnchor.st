tests
testScriptLabelGenerateAnchor
	| item |
	item := (PRScript content: 'foo')
		label: 'myScript';
		yourself.
	self
		assertWriting: item
		includesTexts:
			{(self scriptAnchorForMyScript).
			'myScript'}