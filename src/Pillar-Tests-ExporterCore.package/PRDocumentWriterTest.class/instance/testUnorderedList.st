tests
testUnorderedList
	| item |
	item := PRUnorderedList new
		add: (self addText: '1' to: PRListItem new);
		yourself.
	self
		assertWriting: item
		includesTexts:
			{(self unorderedListBegin).
			(self listItemWith1)}