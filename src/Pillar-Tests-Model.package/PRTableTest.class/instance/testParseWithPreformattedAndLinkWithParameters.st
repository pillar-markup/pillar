tests-parsing
testParseWithPreformattedAndLinkWithParameters
	| wiki tree |
	wiki := '|==\+link\|a\+==|'.
	tree := PRDocument new
		add: (PRTable new
			add: (PRTableRow new
				add: (PRTableCell new
					add: (PRMonospaceFormat new
						add: (PRText content: '+link|a+');
						yourself);
					yourself);
				add: (PRTableCell new
					yourself);
				yourself);
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.