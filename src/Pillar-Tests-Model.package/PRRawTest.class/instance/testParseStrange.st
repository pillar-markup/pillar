tests-parsing
testParseStrange
	| wiki text tree |
	wiki := '{{{a{{||}}b}}}'.
	text := 'a{{||}}b'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: 'a{{||}}b');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text