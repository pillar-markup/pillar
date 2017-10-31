tests-parsing
testParseBasic
	| wiki text tree |
	wiki := '@name'.
	text := ''.
	tree := PRDocument new
		add: (PRAnchor named: 'name');
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text