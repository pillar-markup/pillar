tests-parsing
testParseNested
	| wiki text tree |
	wiki := '1' , markup , '2' , (PRPillarGrammar markups at: self otherClass) , '3'
		, (PRPillarGrammar markups at: self otherClass) , '4' , markup , '5'.
	text := '12345'.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (PRText content: '1');
				add:
					(self actualClass new
						add: (PRText content: '2');
						add:
							(self otherClass new
								add: (PRText content: '3');
								yourself);
						add: (PRText content: '4');
						yourself);
				add: (PRText content: '5');
				yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text