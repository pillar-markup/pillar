tests
testNonTextAlias
	| wiki text tree |
	wiki := self markup , 'foo ""Alias"">' , self referenceString , self markup.
	text := 'foo Alias'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (self actualClass new
				add: (PRText content: 'foo ');
				add: (self addText: 'Alias' to: PRBoldFormat new);
				reference: self referenceString;
				yourself);
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text