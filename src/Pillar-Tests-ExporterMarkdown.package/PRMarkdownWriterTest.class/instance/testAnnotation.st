tests
testAnnotation
	| note tip warning caution important nonRecognized text |
	text := PRText content: 'foo'.
	note := PRAnnotatedParagraph new
		annotation: 'note';
		add: text.
	tip := PRAnnotatedParagraph new
		annotation: 'tip';
		add: text.
	warning := PRAnnotatedParagraph new
		annotation: 'warning';
		add: text.
	caution := PRAnnotatedParagraph new
		annotation: 'caution';
		add: text.
	important := PRAnnotatedParagraph new
		annotation: 'todo';
		add: text.
	nonRecognized := PRAnnotatedParagraph new
		annotation: 'toto';
		add: text.
	self assertWriting: note includesText: self resultForNote.
	self assertWriting: tip includesText: self resultForTip.
	self assertWriting: warning includesText: self resultForWarning.
	self assertWriting: caution includesText: self resultForCaution.
	self assertWriting: important includesText: self resultForImportant.
	self assert: (self write: nonRecognized) trimRight equals: (self resultForNotRecognizedPatterns, text text).