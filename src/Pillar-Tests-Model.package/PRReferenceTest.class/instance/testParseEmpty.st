tests-parsing
testParseEmpty
	| wiki1 wiki2 text tree |
	wiki1 := self markup , self markup.
	wiki2 := '\' , self markup , '\' , self markup.
	text := self markup , self markup.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: self markup , self markup);
				yourself);
		yourself.
	self assertWiki: wiki1 equalsTree: tree.
	self assertWiki: wiki2 equalsTree: tree.
	self assertTree: tree equalsWiki: wiki2.
	self assertTree: tree equalsText: text