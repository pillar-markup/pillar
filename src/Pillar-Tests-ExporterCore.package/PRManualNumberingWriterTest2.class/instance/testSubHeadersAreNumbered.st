tests
testSubHeadersAreNumbered
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
						level: 2;
						add: (PRText content: 'foo');
						counter:
								((PRCascadingCounter maxLevel: 5)
										incrementAt: 1;
										incrementAt: 2);
						yourself);
		yourself.
	self configuration printer  level1: (PRLevelNumberPrinter new headerSize: 1; level: 1; yourself). 
	self
		assertWriting: item
		includesTexts:
			{self counter1DefinitionString.
			self counter11DefinitionString}