tests-parsing
testParseOneLine
	| wiki text tree |
	wiki := 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nulla quis urna.'.
	text := wiki.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: wiki);
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text