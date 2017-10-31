tests - Format
testSubscriptFormatWithEscaped
	super testSubscriptFormatWithEscaped.
	self assert: result equals: (PRSubscriptFormat with: (PRText content: '@@'))