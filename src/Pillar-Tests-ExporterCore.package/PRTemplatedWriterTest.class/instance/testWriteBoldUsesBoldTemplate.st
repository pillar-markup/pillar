tests-templatefiles
testWriteBoldUsesBoldTemplate

	self
		assertTemplate: PRTemplatedWriter boldTemplateFileName
		writesValue: 'boldTemplate'
		forNode: (PRBoldFormat with: (PRText content: 'Bar'))