tests-templatefiles
testWriteAnchorUsesDefaultIfNotSpecificIsDefinedTemplate

	self
		assertTemplate: PRTemplatedWriter defaultAnnotatedParagraphTemplateFileName
		writesValue: 'annotated paragraph'
		forNode: (PRAnnotatedParagraph withAll: #() annotation: 'todo')