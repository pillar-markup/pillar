tests-parsing
testParseTwoConsecutiveNonTextLines
	| wiki text tree sentence title nLine |
	nLine := Smalltalk os lineEnding.
	sentence := 'sentence'.
	title := 'title'.
	wiki := sentence , nLine , '!' , title.
	text := sentence , nLine , title.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRText content: sentence);
						yourself);
		add:
				(PRHeader new
						level: 1;
						add: (PRText content: title);
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text