tests-parsing
testParseMixed
	| wiki tree text nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '#1' , nLine , '##2' , nLine , '###3' , nLine , '#-4' , nLine , '#-5' , nLine , '##6' , nLine , '#7'.
	text := '1. 1' , nLine , '	1. 2' , nLine , '		1. 3' , nLine , '	* 4' , nLine , '	* 5' , nLine , '	1. 6' , nLine
		, '2. 7'.
	tree := PRDocument new
		add:
				(PROrderedList new
						add:
								(PRListItem new
										add: (PRText content: '1');
										add:
												(PROrderedList new
														add:
																(PRListItem new
																		add: (PRText content: '2');
																		add:
																				(PROrderedList new
																						add: (self listItemWithText: '3');
																						yourself);
																		yourself);
														yourself);
										add:
												(PRUnorderedList new
														add: (self listItemWithText: '4');
														add: (self listItemWithText: '5');
														yourself);
										add:
												(PROrderedList new
														add: (self listItemWithText: '6');
														yourself);
										yourself);
						add: (self listItemWithText: '7');
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text