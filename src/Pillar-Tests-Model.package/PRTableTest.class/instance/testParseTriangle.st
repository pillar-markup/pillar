tests-parsing
testParseTriangle
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '|a11' , nLine , '|a21|a22' , nLine , '|a31|a32|a33'.
	text := 'a11' , nLine , 'a21	a22' , nLine , 'a31	a32	a33'.
	tree := PRDocument new
		add:
				(PRTable new
						add:
								(PRTableRow new
										add:
												(PRTableCell new
														add: (PRText content: 'a11');
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
						add:
								(PRTableRow new
										add:
												(PRTableCell new
														add: (PRText content: 'a31');
														yourself);
										add:
												(PRTableCell new
														add: (PRText content: 'a32');
														yourself);
										add:
												(PRTableCell new
														add: (PRText content: 'a33');
														yourself);
										yourself);
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text