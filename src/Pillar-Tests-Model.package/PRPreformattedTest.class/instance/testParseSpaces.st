tests-parsing
testParseSpaces
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '=    A line with 3 spaces' , nLine , '= 	A line with a tab'.
	text := '   A line with 3 spaces' , nLine , '	A line with a tab'.
	tree := PRDocument new
		add:
				(PRPreformatted new
						add: (PRText content: '   A line with 3 spaces');
						add: (PRText content: '	A line with a tab');
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text