tests-parsing
testParseMultipleMultiline
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '{{{a' , nLine , 'b}}}c{{{d' , nLine , 'e}}}'.
	text := 'a' , nLine , 'bcd' , nLine , 'e'.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRRaw content: 'a' , nLine , 'b');
						add: (PRText content: 'c');
						add: (PRRaw content: 'd' , nLine , 'e');
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text