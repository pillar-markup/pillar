tests-templatefiles
testWriteCommentedLineUsesCommentedLineTemplate

	self
		assertTemplate: PRTemplatedWriter commentedLineTemplateFileName
		writesValue: 'commented line'
		forNode: (PRCommentedLine content: 'some comment')