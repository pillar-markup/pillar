tests-parsing
testParseSquare
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '|a11|a12' , nLine , '|a21|a22'.
	text := 'a11	a12' , nLine , 'a21	a22'.
	tree := PRDocument new
		add:
				(PRTable new
						add:
								(PRTableRow new
										add:
												(PRTableCell new
														add: (PRText content: 'a11');
														yourself);
										add:
												(PRTableCell new
														add: (PRText content: 'a12');
														yourself);
										yourself);
						add:
								(PRTableRow new
										add:
												(PRTableCell new
														add: (PRText content: 'a21');
														yourself);
										add:
												(PRTableCell new
														add: (PRText content: 'a22');
														yourself);
										yourself);
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text