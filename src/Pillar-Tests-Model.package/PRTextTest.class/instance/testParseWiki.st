tests-parsing
testParseWiki
	| wiki tree |
	wiki := ' !_#-|=]@:<>\*'.
	tree := (PRDocument new)
				add: ((PRParagraph new)
							add: (PRText content: ' !_#-|=]@:<>*');
							yourself);
				yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki