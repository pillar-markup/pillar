tests-parsing
testParseParameters
	| wiki text tree |
	wiki := self markup , 'Alias>' , self referenceString , '|a=1|b=2|c' , self markup .
	text := 'Alias'.
	tree := PRDocument new
		add:
				(PRParagraph new
						add:
								(self actualClass new
										add: (PRText content: 'Alias');
										reference: self referenceString;
										parameters:
												(SmallDictionary new
														add: 'a' -> '1';
														add: 'b' -> '2';
														add: 'c' -> nil;
														yourself);
										yourself);
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text