tests
testScriptWithEvalThatDoesntReturnAParagraph
	| input expected |
	input := PRDocument new
		add:
			(PRParagraph new
				add:
						((PRCodeblock content: 'stream nextPutAll: ''-test''')
								eval: true;
								yourself);
				yourself) yourself.
	expected := PRDocument new
		add:
			(PRParagraph new
				add: (PRUnorderedList new add: (PRListItem new add: (PRText content: 'test')));
				yourself) yourself.
	self assert: (self executePhase: input with: self configuration) equals: expected