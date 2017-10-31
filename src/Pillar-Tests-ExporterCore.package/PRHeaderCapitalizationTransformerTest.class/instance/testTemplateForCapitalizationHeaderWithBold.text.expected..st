tests
testTemplateForCapitalizationHeaderWithBold: aType text: aString expected: anotherString

	|input expected config |
	config := self configuration.
	self addHeader: (Dictionary with: 'capitalization' -> aType) ofLevel: 2 to: config.
	
	input := PRDocument new 
		add:
				(PRHeader new level: 2;
					add: (PRBoldFormat new
								add: (PRText content: aString)));
		yourself.
	
	expected := PRDocument new 
		add:
				(PRHeader new level: 2;
					add: (PRBoldFormat new
								add: (PRText content: anotherString)));
		yourself.
	self assert: (self executePhase: input with: config) equals: expected