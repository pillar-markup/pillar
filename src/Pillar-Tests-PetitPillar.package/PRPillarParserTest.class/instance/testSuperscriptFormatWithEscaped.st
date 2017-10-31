tests - Format
testSuperscriptFormatWithEscaped
	super testSuperscriptFormatWithEscaped.
	self assert: result equals: (PRSuperscriptFormat with: (PRText content: '^^'))