tests-parsing
testParseNested
	| wiki text tree |
	wiki := '!!Hello *Link*'.
	text := 'Hello Link'.
	tree := PRDocument new
		add: (PRHeader new
			level: 2;
			add: (PRText content: 'Hello ');
			add: (PRInternalLink new
				reference: 'Link';
				yourself);
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text