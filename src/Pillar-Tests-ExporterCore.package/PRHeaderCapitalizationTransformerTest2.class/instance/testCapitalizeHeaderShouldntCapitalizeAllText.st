tests
testCapitalizeHeaderShouldntCapitalizeAllText
	| input printer spec newInstance expected configuration |
	configuration := self configuration. 
	printer := PRTitlePrinter new.
	spec := printer printerSpecFor: 'roman'.
	spec capitalization: 'upper case'.
	printer level2: spec.
	configuration printer: printer.
	newInstance := self actualInstance printer: printer.
	
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
		
	self assert: (self executePhase: input with: configuration) equals: expected.