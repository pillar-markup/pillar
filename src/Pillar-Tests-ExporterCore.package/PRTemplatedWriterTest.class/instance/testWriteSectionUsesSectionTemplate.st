tests-templatefiles
testWriteSectionUsesSectionTemplate

	self
		assertTemplate: PRTemplatedWriter sectionTemplateFileName
		writesValue: 'section'
		forNode: PRSection new