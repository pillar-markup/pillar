tests-templatefiles
testWriteHorizontalRuleUsesHorizontalRuleTemplate

	self
		assertTemplate: PRTemplatedWriter horizontalRuleTemplateFileName
		writesValue: '-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-='
		forNode: PRHorizontalRule new