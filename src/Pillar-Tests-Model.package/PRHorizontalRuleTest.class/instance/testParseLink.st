tests-parsing
testParseLink
	| wiki1 wiki2 text tree |
	wiki1 := '_ *link*'.
	wiki2 := '\_ *link*'.
	text := '_ link'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: '_ ');
			add: (PRInternalLink new
				reference: 'link';
				yourself);
			yourself);
		yourself.
	self assertWiki: wiki1 equalsTree: tree.
	self assertWiki: wiki2 equalsTree: tree.
	self assertTree: tree equalsWiki: wiki2.
	self assertTree: tree equalsText: text