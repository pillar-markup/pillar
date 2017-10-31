tests-parsing
testParseWithNewLine
	| wiki text tree |
	wiki := '1' , markup , '2', Smalltalk os lineEnding, '3' , markup , '4'.
	text := '12', Smalltalk os lineEnding, '34'.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: '1');
				add: (self actualClass with: (PRText content: '2', Smalltalk os lineEnding, '3'));
				add: (PRText content: '4');
				yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text