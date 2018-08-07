tests - Format
testBoldFormatWithEscaped
	super testBoldFormatWithEscaped.
	self assert: result equals: (PRBoldFormat with: (PRText content: '""'))