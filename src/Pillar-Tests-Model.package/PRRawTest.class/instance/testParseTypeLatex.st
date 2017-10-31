tests-parsing
testParseTypeLatex
	| wiki text tree |
	wiki := '{{{latex:abc}}}'.
	text := ''.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: 'abc' type: 'latex');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text