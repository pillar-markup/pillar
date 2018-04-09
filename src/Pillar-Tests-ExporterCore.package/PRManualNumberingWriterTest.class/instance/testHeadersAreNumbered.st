tests
testHeadersAreNumbered
	| item |
	item := PRDocument new
		add:
				(PRHeader new
						level: 1;
						add: (PRText content: 'foo');
						counter: ((PRCascadingCounter maxLevel: 5) incrementAt: 1);
						yourself);
		add:
				(PRHeader new
						level: 1;
						add: (PRText content: 'foo');
						counter:
								((PRCascadingCounter maxLevel: 5)
										incrementAt: 1;
										incrementAt: 1);
						yourself);
		yourself.
	
	self configuration printer level1: (PRLevelNumberPrinter new level: 1 ; headerSize: 1; yourself).
	
	self
		assertWriting: item
		includesTexts:
			{self counter1DefinitionString.
			self counter2DefinitionString}