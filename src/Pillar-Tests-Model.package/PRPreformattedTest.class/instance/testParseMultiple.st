tests-parsing
testParseMultiple
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '= line 1.1' , nLine , '= line 1.2' , nLine , nLine , '= line 2.1'.
	text := 'line 1.1' , nLine , 'line 1.2' , nLine , nLine , 'line 2.1'.
	tree := PRDocument new
		add:
				(PRPreformatted new
						add: (PRText content: 'line 1.1');
						add: (PRText content: 'line 1.2');
						yourself);
		add: PREmptyParagraph new;
		add:
				(PRPreformatted new
						add: (PRText content: 'line 2.1');
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text