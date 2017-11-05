tests-parsing
testParseAliasedEmpty
	| wiki text tree |
	wiki := self markup , '>' , self referenceString , self markup.
	text := ''.
	tree := PRDocument new
		add:
			(PRParagraph new
				add:
					(self actualClass new
						add: (PRText content: '');
						reference: self referenceString;
						yourself);
				yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text