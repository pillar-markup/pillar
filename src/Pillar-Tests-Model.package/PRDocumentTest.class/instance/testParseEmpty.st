tests-parsing
testParseEmpty
	| wiki text tree |
	wiki := String new.
	text := String new.
	tree := PRDocument new.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text