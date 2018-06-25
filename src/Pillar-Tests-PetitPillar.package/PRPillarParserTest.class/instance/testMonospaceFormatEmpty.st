tests - Format
testMonospaceFormatEmpty
	super testMonospaceFormatEmpty.
	self assert: result equals: PRMonospaceFormat new.
	self assertStart: 1 stop: 4.