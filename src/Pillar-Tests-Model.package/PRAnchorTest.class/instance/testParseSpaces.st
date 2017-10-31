tests-parsing
testParseSpaces
	| wiki text tree |
	wiki := '@one two'.
	text := ''.
	tree := PRDocument new
		add: (PRAnchor named: 'one two');
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text