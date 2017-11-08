tests
testCheckRawWithGoodType
	| input |
	input := PRDocument new
		add:
			(PRParagraph new
				add: (PRRaw content: '<p>Timoleon</p>' type: 'html');
				yourself);
		yourself.
	self
		assert:
			(self actualClass executeOn:
					(PRCompilationContext
						withDocument: input
						withConfiguration: self configurationClass new)) input
		equals: input