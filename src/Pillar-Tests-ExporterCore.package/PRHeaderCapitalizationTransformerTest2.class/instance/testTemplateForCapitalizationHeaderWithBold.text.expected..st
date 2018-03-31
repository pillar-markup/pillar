helpers
testTemplateForCapitalizationHeaderWithBold: aType text: aString expected: anotherString
	| input printer spec expected configuration |
	configuration := self configuration. 
	printer := PRTitlePrinter new.
	spec := printer printerSpecFor: 'roman'.
	spec capitalization: aType.
	printer level2: spec.
	configuration printer: printer. 
	
	input := PRDocument new
		add:
			(PRHeader new
				level: 2;
				add: (PRBoldFormat new add: (PRText content: aString)));
		yourself.
	expected := PRDocument new
		add:
			(PRHeader new
				level: 2;
				add: (PRBoldFormat new add: (PRText content: anotherString)));
		yourself.
		
	self assert: (self executePhase: input with: configuration) equals: expected