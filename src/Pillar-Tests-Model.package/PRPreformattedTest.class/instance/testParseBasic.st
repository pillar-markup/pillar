tests-parsing
testParseBasic
	| wiki text tree |
	wiki := '= Line'.
	text := 'Line'.
	tree := PRDocument new
		add: (PRPreformatted new
			add: (PRText content: 'Line');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text