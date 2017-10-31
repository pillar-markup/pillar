tests-parsing
testParseBasic
	| wiki text tree |
	wiki := '{{{abc}}}'.
	text := 'abc'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: 'abc');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text