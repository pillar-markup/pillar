tests-parsing
testParseMultiline
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '!!Hello ""This is' , nLine , 'bold"" end' , nLine , 'new'.
	text := 'Hello This is' , nLine , 'bold end' , nLine , 'new'.
	tree := PRDocument new
		add:
				(PRHeader new
						level: 2;
						add: (PRText content: 'Hello ');
						add: (self addText: 'This is' , nLine , 'bold' to: PRBoldFormat new);
						add: (PRText content: ' end');
						yourself);
		add: (self addText: 'new' to: PRParagraph new);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text