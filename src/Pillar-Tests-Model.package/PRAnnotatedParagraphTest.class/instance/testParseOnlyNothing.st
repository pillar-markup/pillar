tests-parsing
testParseOnlyNothing
	| wiki text tree |
	wiki := '@@'.
	text := ''.
	tree := PRDocument new
		add: (PRAnnotatedParagraph new
			annotation: '';
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text