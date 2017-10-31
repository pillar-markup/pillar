tests-parsing
testParseEmpty
	| wiki text tree |
	wiki := '!'.
	text := ''.
	tree := PRDocument new
		add: (PRHeader new
			level: 1;
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text