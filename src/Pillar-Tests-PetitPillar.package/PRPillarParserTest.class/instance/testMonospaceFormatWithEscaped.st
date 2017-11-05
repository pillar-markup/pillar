tests - Format
testMonospaceFormatWithEscaped
	super testMonospaceFormatWithEscaped.
	self assert: result equals: (PRMonospaceFormat with: (PRText content: '=='))