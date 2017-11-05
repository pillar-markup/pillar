tests
testCapitalizeHeaderShouldntCapitalizeAllText
	| input expected config newInstance |
	config :=  self configurationClass  new.
	self addHeader: (Dictionary with: 'capitalization' -> 'upper case') ofLevel: 2 to: config.
	newInstance := self actualInstance configuration: config.
	input := PRDocument new
		add: (PRParagraph new add: (PRText content: 'should not be capitalized'));
		add:
			(PRHeader new
				level: 2;
				add: (PRText content: 'Header'));
		add: (PRParagraph new add: (PRText content: 'should not be capitalized'));
		yourself.
	expected := PRDocument new
		add: (PRParagraph new add: (PRText content: 'should not be capitalized'));
		add:
			(PRHeader new
				level: 2;
				add: (PRText content: 'HEADER'));
		add: (PRParagraph new add: (PRText content: 'should not be capitalized'));
		yourself.
	self
		assert:
			(newInstance
				start: input)
		equals: expected