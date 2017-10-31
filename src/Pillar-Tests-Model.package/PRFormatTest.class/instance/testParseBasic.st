tests-parsing
testParseBasic
	| wiki text tree |
	wiki := '1' , markup , '2' , markup , '3'.
	text := '123'.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: '1');
				add: (self actualClass with: (PRText content: '2'));
				add: (PRText content: '3');
				yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text