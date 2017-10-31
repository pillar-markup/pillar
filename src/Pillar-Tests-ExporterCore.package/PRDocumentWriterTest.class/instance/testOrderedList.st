tests
testOrderedList
	| item |
	item := PROrderedList new
		add: (self addText: '1' to: PRListItem new);
		yourself.
	self
		assertWriting: item
		includesTexts:
			{(self orderedListBegin).
			(self listItemWith1)}