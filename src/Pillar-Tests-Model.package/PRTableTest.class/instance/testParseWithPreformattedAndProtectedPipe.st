tests-parsing
testParseWithPreformattedAndProtectedPipe
	| wiki tree |
	wiki := '|==\|==|'.
	tree := PRDocument new
		add: (PRTable new
			add: (PRTableRow new
				add: (PRTableCell new
				  
					add: (PRMonospaceFormat new
						add: (PRText content: '|');
						yourself);
			
					yourself);
				add: (PRTableCell new
					yourself);
				yourself);
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.