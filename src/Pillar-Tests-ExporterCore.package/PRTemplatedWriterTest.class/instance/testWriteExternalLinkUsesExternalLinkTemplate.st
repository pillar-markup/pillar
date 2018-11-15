tests-templatefiles
testWriteExternalLinkUsesExternalLinkTemplate

	self
		assertTemplate: PRTemplatedWriter externalLinkTemplateFileName
		writesValue: 'external link'
		forNode: (PRExternalLink new reference: 'http://pharo.org')