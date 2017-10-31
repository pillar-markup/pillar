tests-parsing
testParseHeading2
	| wiki1 wiki2 text tree |
	wiki1 := '|!head|!{left|!|center|!}right'.
	wiki2 := '|!head|{!left||!center|}!right'.
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
	self assertWiki: wiki1 equalsTree: tree.
	self assertTree: tree equalsWiki: wiki2.
	self assertTree: tree equalsText: text