tests-parsing
testParseParagraph
	| wiki text tree |
	wiki := '\_ is parsed as paragraph'.
	text := '_ is parsed as paragraph'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: '_ is parsed as paragraph');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text