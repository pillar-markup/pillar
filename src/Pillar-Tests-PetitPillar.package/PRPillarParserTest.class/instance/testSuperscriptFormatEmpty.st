tests - Format
testSuperscriptFormatEmpty
	super testSuperscriptFormatEmpty.
	self assert: result equals: PRSuperscriptFormat new.
	self assertStart: 1 stop: 4.