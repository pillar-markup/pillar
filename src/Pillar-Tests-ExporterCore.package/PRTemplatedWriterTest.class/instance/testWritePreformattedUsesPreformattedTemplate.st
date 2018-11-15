tests-templatefiles
testWritePreformattedUsesPreformattedTemplate

	self
		assertTemplate: PRTemplatedWriter preformattedTemplateFileName
		writesValue: 'preformatted'
		forNode: (PRPreformatted with: (PRText content: 'Bar'))