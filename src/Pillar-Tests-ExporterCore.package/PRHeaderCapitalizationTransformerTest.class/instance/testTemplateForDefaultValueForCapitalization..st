tests
testTemplateForDefaultValueForCapitalization: aString

	|input config |
	config := self configuration.
	self addHeader: (Dictionary new ) ofLevel: 2 to: config.
	
	input := PRDocument new 
		add:
				(PRHeader new level: 2;
					add: (PRText content: aString));
		yourself.
	self assert: (self executePhase: input with: config) equals: input