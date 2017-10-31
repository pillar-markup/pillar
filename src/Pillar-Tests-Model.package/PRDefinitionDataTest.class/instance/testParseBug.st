tests
testParseBug
	| wiki1 wiki2 tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki1 := '::1' , nLine , '::-2'.
	wiki2 := ':' , nLine , '::1' , nLine , '::-2'.
	tree := PRDocument new
		add:
				(PRDefinitionList new
						add:
								(PRDataItem new
										add:
												(PRDefinitionList new
														add:
																(PRDataItem new
																		add: (PRText content: '1');
																		add:
																				(PRUnorderedList new
																						add:
																								(PRListItem new
																										add: (PRText content: '2');
																										yourself);
																						yourself);
																		yourself);
														yourself);
										yourself);
						yourself);
		yourself.
	self assertWiki: wiki1 equalsTree: tree.
	self assertWiki: wiki2 equalsTree: tree.
	self assertTree: tree equalsWiki: wiki2