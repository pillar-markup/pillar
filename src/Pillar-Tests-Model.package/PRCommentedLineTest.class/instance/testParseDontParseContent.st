tests-parsing
testParseDontParseContent
	| wiki text tree |
	wiki := '%some *comment*'.
	text := ''.
	tree := PRDocument new
		add: (PRCommentedLine content: 'some *comment*');
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text