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
	self configuration
		level1:
			((PRLevelNumberConfiguration with: (Dictionary with: 'rendering' -> true with: 'size' -> 1 with: 'renderAs' -> 'number'))
				level: 1;
				configuration: self configuration;
				yourself).
	self
		assertWriting: item
		includesTexts:
			{self counter1DefinitionString.
			self counter2DefinitionString}