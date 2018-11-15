tests-templatefiles
testWriteEmptyParagraphsUsesEmptyParagraphTemplate

	self
		assertTemplate: PRTemplatedWriter emptyParagraphTemplateFileName
		writesValue: 'emptyParagraph'
		forNode: PREmptyParagraph new