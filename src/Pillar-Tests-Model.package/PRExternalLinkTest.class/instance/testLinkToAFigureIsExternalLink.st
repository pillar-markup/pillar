tests
testLinkToAFigureIsExternalLink
	| wiki text tree |
	wiki := '*file://foo.png*'.
	text := self actualClass new
		reference: 'file://foo.png';
		title.
	tree := PRDocument new
		add: (PRParagraph new
			add: (self actualClass new
				reference: 'file://foo.png';
				yourself);
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text