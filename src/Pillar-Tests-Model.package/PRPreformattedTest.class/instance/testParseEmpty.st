tests-parsing
testParseEmpty
	| wiki text tree |
	wiki := '= '.
	text := ''.
	tree := PRDocument new
		add: (PRPreformatted new
			add: (PRText content: '');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text