tests-templatefiles
testWriteDefinitionListUsesDefinitionListTemplate

	self
		assertTemplate: PRTemplatedWriter definitionListTemplateFileName
		writesValue: 'definitionList'
		forNode: PRDefinitionList new