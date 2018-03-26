helpers
testTemplateForCapitalizationHeaderWithBold: aType text: aString expected: anotherString
	| input printer spec expected |
	printer := PRTitlePrinter new.
	spec := printer printerSpecFor: 'roman'.
	spec capitalization: aType.
	printer level2: spec.
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
		
	self assert: ((self actualClass new printer: printer) start: input) equals: expected.
	self flag: #guille	
	"self assert: (self executePhase: input with: printer) equals: expected"