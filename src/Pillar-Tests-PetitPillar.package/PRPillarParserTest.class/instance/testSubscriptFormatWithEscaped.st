tests - Format
testSubscriptFormatWithEscaped
	super testSubscriptFormatWithEscaped.
	self assert: result equals: (PRSubscriptFormat with: (PRText content: '@@')).
	self assertStart: 1 stop: 8.
	self assertStart: 3 stop: 6 ofNode: result children first.