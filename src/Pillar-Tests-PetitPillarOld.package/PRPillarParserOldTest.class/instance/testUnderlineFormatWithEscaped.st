tests - Format
testUnderlineFormatWithEscaped
	super testUnderlineFormatWithEscaped.
	self assert: result equals: (PRUnderlineFormat with: (PRText content: '__'))