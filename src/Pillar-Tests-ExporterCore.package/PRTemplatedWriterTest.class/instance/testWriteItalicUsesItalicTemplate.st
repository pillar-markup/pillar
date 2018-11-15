tests-templatefiles
testWriteItalicUsesItalicTemplate

	self
		assertTemplate: PRTemplatedWriter italicTemplateFileName
		writesValue: 'italicTemplate'
		forNode: (PRItalicFormat with: (PRText content: 'Bar'))