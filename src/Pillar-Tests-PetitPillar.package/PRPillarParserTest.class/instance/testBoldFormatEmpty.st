tests - Format
testBoldFormatEmpty
	super testBoldFormatEmpty.
	self assert: result equals: PRBoldFormat new.
	self assertStart: 1 stop: 4.