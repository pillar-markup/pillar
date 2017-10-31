tests-parsing
testParseWithTrailingSpaces
	| wiki text tree |
	wiki := '!  foo'.
	text := 'foo'.
	tree := PRDocument new
		add: ((PRHeader new)
			level: 1;
			add: (PRText content: 'foo');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsText: text