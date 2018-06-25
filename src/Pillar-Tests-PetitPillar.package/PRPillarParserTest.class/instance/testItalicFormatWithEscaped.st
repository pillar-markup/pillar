tests - Format
testItalicFormatWithEscaped
	super testItalicFormatWithEscaped.
	self assert: result equals: (PRItalicFormat with: (PRText content: '''''')).
	self assertStart: 1 stop: 8.
	self assertStart: 3 stop: 6 ofNode: result children first.