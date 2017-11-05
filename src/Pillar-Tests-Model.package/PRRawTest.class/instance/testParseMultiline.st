tests-parsing
testParseMultiline
	| wiki text tree nLine|
	nLine := Smalltalk os lineEnding.
	wiki := '{{{a' , nLine , 'b}}}'.
	text := 'a' , nLine , 'b'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRRaw content: 'a' , nLine , 'b');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text