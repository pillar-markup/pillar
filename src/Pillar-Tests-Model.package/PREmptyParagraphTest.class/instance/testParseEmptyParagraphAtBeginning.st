tests
testParseEmptyParagraphAtBeginning
	| wiki text tree content |
	content := 'Lorem ipsum dolor sit amet.'.
	wiki := Smalltalk os lineEnding , content.
	text := wiki.
	tree := PRDocument new
		add: PREmptyParagraph new;
		add:
				(PRParagraph new
						add: (PRText content: content);
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text