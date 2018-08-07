tests - Format
testStrikethroughFormatEmpty
	super testStrikethroughFormatEmpty.
	self assert: result equals: PRStrikethroughFormat new.
	self assertStart: 1 stop: 4.