tests-parsing
testParseEscape
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '[[[language=foo\|' , nLine , 'foo' , nLine , ']]]'.
	text := 'foo'.
	tree := PRDocument new
		add:
			((PRCodeblock content: 'foo')
				language: 'foo|';
				yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text