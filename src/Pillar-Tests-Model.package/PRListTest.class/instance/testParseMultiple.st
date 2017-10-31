tests-parsing
testParseMultiple
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := self wikiString , '1st' , nLine , self wikiString , '2nd' , nLine , nLine , self wikiString , '3rd'.
	text := (self textString: 1 level: 1) , '1st' , nLine , (self textString: 2 level: 1) , '2nd' , nLine , nLine
		, (self textString: 1 level: 1) , '3rd'.
	tree := PRDocument new
		add:
				(self actualClass new
						add: (self listItemWithText: '1st');
						add: (self listItemWithText: '2nd');
						yourself);
		add: PREmptyParagraph new;
		add:
				(self actualClass new
						add: (self listItemWithText: '3rd');
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text