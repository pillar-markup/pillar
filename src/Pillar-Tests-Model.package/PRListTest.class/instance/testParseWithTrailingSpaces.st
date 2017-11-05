tests-parsing
testParseWithTrailingSpaces
	| wiki tree |
	wiki := self wikiString , ' 1st'.
	tree := PRDocument new
		add:
			(self actualClass new
				add: (self listItemWithText: '1st');
				yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree