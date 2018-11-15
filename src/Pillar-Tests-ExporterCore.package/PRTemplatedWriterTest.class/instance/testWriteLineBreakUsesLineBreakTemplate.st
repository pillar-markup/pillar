tests-templatefiles
testWriteLineBreakUsesLineBreakTemplate

	self
		assertTemplate: PRTemplatedWriter lineBreakTemplateFileName
		writesValue: 'line break'
		forNode: PRLineBreak new