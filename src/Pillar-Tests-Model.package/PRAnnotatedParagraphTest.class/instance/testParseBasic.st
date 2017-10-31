tests-parsing
testParseBasic
	| wiki text tree |
	wiki := '@@foo bar zork'.
	text := 'bar zork'.
	tree := PRDocument new
		add: (PRAnnotatedParagraph new
			annotation: 'foo';
			add: (PRText content: 'bar zork');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text