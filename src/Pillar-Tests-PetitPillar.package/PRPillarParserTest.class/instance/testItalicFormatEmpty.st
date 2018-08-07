tests - Format
testItalicFormatEmpty
	super testItalicFormatEmpty.
	self assert: result equals: PRItalicFormat new.
	self assertStart: 1 stop: 4.