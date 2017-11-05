tests
testNestingListWith2ItemWith2SubItem
	| item expected |
	item := PRUnorderedList new
		add:
			(PRListItem new
				add:
					(PROrderedList new
						add:
							(PRListItem new
								add: (PRText content: self listItemWith1);
								add:
									(PROrderedList new
										add:
											(PRListItem new
												add: (PRText content: self listItemWith1);
												yourself);
										yourself);
								yourself);
						yourself);
				yourself);
		add:
			(PRListItem new
				add: (PRText content: self listItemWith1);
				yourself);
		yourself.
	expected := '' writeStream << self unorderedListBegin << self configuration newLine << '  '
		<< self orderedListBegin << self listItemWith1 << self configuration newLine << '    ' << self orderedListBegin
		<< self listItemWith1 << self configuration newLine << self unorderedListBegin << self listItemWith1.
	self assert: (self write: item) includesSubstring: expected contents