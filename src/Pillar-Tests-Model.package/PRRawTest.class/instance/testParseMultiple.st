tests-parsing
testParseMultiple
	| wiki text tree |
	wiki := '{{{a}}}b{{{c}}}'.
	text := 'abc'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: 'a');
			add: (PRText content: 'b');
			add: (PRRaw content: 'c');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text