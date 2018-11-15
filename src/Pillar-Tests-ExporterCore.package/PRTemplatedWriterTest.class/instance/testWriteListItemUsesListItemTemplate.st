tests-templatefiles
testWriteListItemUsesListItemTemplate

	self
		assertTemplate: PRTemplatedWriter listItemTemplateFileName
		writesValue: 'list item'
		forNode: PRListItem new