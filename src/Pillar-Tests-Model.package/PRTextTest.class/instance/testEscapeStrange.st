tests-parsing
testEscapeStrange
	| wiki tree |
	wiki := '< text' , Smalltalk os lineEnding , '> text'.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRText content: '< text');
						add: PRLineBreak new;
						add: (PRText content: '> text');
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki