tests-templatefiles
testWriteCodeBlockUsesCodeBlockTemplate

	self
		assertTemplate: PRTemplatedWriter codeBlockTemplateFileName
		writesValue: 'codeBlockTemplate'
		forNode: (PRCodeblock content: '^ self')