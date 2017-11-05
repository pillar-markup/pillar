tests-parsing
testParseMultiple
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '_' , nLine , '_' , nLine , nLine , '_'.
	text := self textString , nLine , self textString , nLine , nLine , self textString.
	tree := PRDocument new
		add: PRHorizontalRule new;
		add: PRHorizontalRule new;
		add: PREmptyParagraph new;
		add: PRHorizontalRule new;
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text