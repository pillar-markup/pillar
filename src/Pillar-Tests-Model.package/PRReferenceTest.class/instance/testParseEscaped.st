tests-parsing
testParseEscaped
	| wiki text tree |
	wiki := 'Star \*' , self referenceString , '\*' , Smalltalk os lineEnding , 'Cross \+' , self referenceString , '\+'.
	text := 'Star *' , self referenceString , '*' , Smalltalk os lineEnding , 'Cross +' , self referenceString , '+'.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRText content: 'Star *' , self referenceString , '*');
						add: PRLineBreak new;
						add: (PRText content: 'Cross +' , self referenceString , '+');
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text