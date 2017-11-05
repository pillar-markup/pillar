tests - Format
testItalicFormatWithEscaped
	super testItalicFormatWithEscaped.
	self assert: result equals: (PRItalicFormat with: (PRText content: ''''''))