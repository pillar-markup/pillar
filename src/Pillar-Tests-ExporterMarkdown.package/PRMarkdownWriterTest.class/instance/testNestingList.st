tests
testNestingList
	| item expected |
	item := PRUnorderedList new
		add:
			(PRListItem new
				add:
					(PROrderedList new
						add:
							(PRListItem new
								add: (PRText content: self listItemWith1);
								yourself);
						yourself);
				yourself);
		yourself.
	expected := '' writeStream << '- ' << self configuration newLine << '  ' << self orderedListBegin
		<< self listItemWith1.
	self assert: (self write: item) includesSubstring: expected contents