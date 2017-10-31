tests-parsing
testParseEasyness
	| wiki1 wiki2 text tree |
	wiki1 := self markup , Smalltalk os lineEnding , self markup , self referenceString.
	wiki2 := '\' , self markup , Smalltalk os lineEnding , '\' , self markup , self referenceString.
	text := self markup , Smalltalk os lineEnding , self markup , self referenceString.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: self markup);
				add: PRLineBreak new;
				add: (PRText content: self markup , self referenceString);
				yourself);
		yourself.
	self assertWiki: wiki1 equalsTree: tree.
	self assertWiki: wiki2 equalsTree: tree.
	self assertTree: tree equalsWiki: wiki2.
	self assertTree: tree equalsText: text