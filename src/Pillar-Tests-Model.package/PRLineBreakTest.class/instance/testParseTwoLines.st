tests-parsing
testParseTwoLines
	| wiki text tree |
	wiki := 'Lorem ipsum dolor sit amet.' , Smalltalk os lineEnding , 'Nulla quis urna.'.
	text := wiki.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRText content: 'Lorem ipsum dolor sit amet.');
						add: PRLineBreak new;
						add: (PRText content: 'Nulla quis urna.') yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text