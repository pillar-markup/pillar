tests
testDefinitionList
	| item |
	item := PRDefinitionList new
		add: (self addText: 'foo' to: PRTermItem new);
		add: (self addText: 'bar' to: PRDataItem new);
		yourself.
	self
		assertWriting: item
		includesTexts:
			{self definitionListBegin.
			self termItemWithFoo.
			self dataItemWithBar}