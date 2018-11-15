tests-templatefiles
testWriteParagraphUsesParagraphTemplate

	self
		assertTemplate: PRTemplatedWriter unorderedListTemplateFileName
		writesValue: 'unorderedList'
		forNode: PRUnorderedList new