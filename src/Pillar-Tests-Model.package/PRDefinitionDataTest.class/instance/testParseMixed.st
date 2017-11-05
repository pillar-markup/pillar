tests
testParseMixed
	| wiki tree |
	wiki := ';1' , Smalltalk os lineEnding , ':2'.
	tree := PRDocument new
		add:
				(PRDefinitionList new
						add:
								(PRTermItem new
										add: (PRText content: '1');
										yourself);
						add:
								(PRDataItem new
										add: (PRText content: '2');
										yourself);
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki