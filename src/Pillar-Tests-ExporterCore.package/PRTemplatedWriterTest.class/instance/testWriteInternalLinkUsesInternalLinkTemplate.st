tests-templatefiles
testWriteInternalLinkUsesInternalLinkTemplate

	self
		assertTemplate: PRTemplatedWriter internalLinkTemplateFileName
		writesValue: 'internal link'
		forNode: (PRInternalLink new reference: 'bla.pillar')