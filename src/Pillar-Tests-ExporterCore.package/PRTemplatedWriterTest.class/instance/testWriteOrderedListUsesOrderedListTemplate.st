tests-templatefiles
testWriteOrderedListUsesOrderedListTemplate

	self
		assertTemplate: PRTemplatedWriter orderedListTemplateFileName
		writesValue: 'ordered list'
		forNode: PROrderedList new