tests - Format
testFormatWithLink
	super testFormatWithLink.
	self assert: result equals: (PRBoldFormat with: (PRInternalLink reference: 'foo'))