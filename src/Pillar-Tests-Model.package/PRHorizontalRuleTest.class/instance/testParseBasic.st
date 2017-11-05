tests-parsing
testParseBasic
	| wiki text tree |
	wiki := '_'.
	text := self textString.
	tree := PRDocument new
		add: PRHorizontalRule new;
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text