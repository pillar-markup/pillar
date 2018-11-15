tests-templatefiles
testWriteMonospaceUsesMonospaceTemplate

	self
		assertTemplate: PRTemplatedWriter monospaceTemplateFileName
		writesValue: 'monospace'
		forNode: (PRMonospaceFormat with: (PRText content: 'Bar'))