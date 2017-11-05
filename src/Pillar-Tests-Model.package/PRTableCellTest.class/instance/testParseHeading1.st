tests-parsing
testParseHeading1
	| wiki text tree |
	wiki := '|!head|{!left||!center|}!right'.
	text := 'head	left	center	right'.
	tree := PRDocument new
		add: (PRTable new
			add: (PRTableRow new
				add: (PRTableCell new
					beHeading;
					add: (PRText content: 'head');
					yourself);
				add: (PRTableCell new
					beHeading;
					beAlignedLeft;
					add: (PRText content: 'left');
					yourself);
				add: (PRTableCell new
					beHeading;
					beAlignedCenter;
					add: (PRText content: 'center');
					yourself);
				add: (PRTableCell new
					beHeading;
					beAlignedRight;
					add: (PRText content: 'right');
					yourself);
				yourself);
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text