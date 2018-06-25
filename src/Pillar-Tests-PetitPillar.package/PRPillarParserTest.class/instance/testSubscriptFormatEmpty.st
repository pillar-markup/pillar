tests - Format
testSubscriptFormatEmpty
	super testSubscriptFormatEmpty.
	self assert: result equals: PRSubscriptFormat new.
	self assertStart: 1 stop: 4.