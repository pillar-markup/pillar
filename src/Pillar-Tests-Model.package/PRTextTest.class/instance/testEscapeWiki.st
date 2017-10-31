tests-parsing
testEscapeWiki
	| wiki tree |
	wiki := 'Wiki: =, |, !, #, {, }, |{, ||, |}, [, ] and -'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: 'Wiki: =, |, !, #, {, }, |{, ||, |}, [, ] and -');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki