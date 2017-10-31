tests-parsing
testParseAlign1
	| wiki text tree |
	wiki := '|{left||center|}right'.
	text := 'left	center	right'.
	tree := PRDocument new
		add: (PRTable new
			add: (PRTableRow new
				add: (PRTableCell new
					beAlignedLeft;
					add: (PRText content: 'left');
					yourself);
				add: (PRTableCell new
					beAlignedCenter;
					add: (PRText content: 'center');
					yourself);
				add: (PRTableCell new
					beAlignedRight;
					add: (PRText content: 'right');
					yourself);
				yourself);
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text