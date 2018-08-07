tests - Format
testUnderlineFormatEmpty
	super testUnderlineFormatEmpty.
	self assert: result equals: PRUnderlineFormat new.
	self assertStart: 1 stop: 4.