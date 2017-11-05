tests-parsing
testParseSpaces
	| wiki text tree |
	wiki := '_       '.
	text := self textString.
	tree := PRDocument new
		add: PRHorizontalRule new;
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: '_'.
	self assertTree: tree equalsText: text