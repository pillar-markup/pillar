tests-parsing
testParseTypeText
	| wiki text tree |
	wiki := '{{{text:abc}}}'.
	text := 'abc'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: 'abc' type: 'text');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text