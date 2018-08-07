tests - Format
testFormatWithLink
	super testFormatWithLink.
	self assert: result equals: (PRBoldFormat with: (PRInternalLink reference: 'foo')).
	self assertStart: 1 stop: 9.
	self assertStart: 3 stop: 7 ofNode: result children first.