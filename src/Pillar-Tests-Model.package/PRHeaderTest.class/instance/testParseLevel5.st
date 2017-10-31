tests-parsing
testParseLevel5
	| wiki text tree |
	wiki := '!!!!!foo'.
	text := 'foo'.
	tree := PRDocument new
		add: ((PRHeader new)
			level: 5;
			add: (PRText content: 'foo');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text