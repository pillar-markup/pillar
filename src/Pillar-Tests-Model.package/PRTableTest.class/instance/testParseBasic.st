tests-parsing
testParseBasic
	| wiki text tree |
	wiki := '|cell'.
	text := 'cell'.
	tree := PRDocument new
		add: (PRTable new
			add: (PRTableRow new
				add: (PRTableCell new
					add: (PRText content: 'cell');
					yourself);
				yourself);
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text