tests
testParse
	| wiki text tree |
	wiki := '${' , self referenceString , '}$'.
	text := ''.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (self actualClass parameters: self referenceParameters);
				yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text