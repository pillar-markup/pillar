tests-templatefiles
testWriteMailLinkUsesMailLinkTemplate

	self
		assertTemplate: PRTemplatedWriter mailLinkTemplateFileName
		writesValue: 'a link'
		forNode: (PRMailLink reference: 'foo@bar.com')