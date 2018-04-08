helpers
testTemplateForCapitalizationHeader: aType text: aString expected: anotherString
	| input printer spec expected configuration |
	configuration := self configuration.
	printer := configuration printer.
	spec := printer printerSpecFor: 'roman'.
	spec capitalization: aType.
	printer level2: spec.
	
	input := PRDocument new
		add:
			(PRHeader new
				level: 2;
				add: (PRText content: aString));
		yourself.
	expected := PRDocument new
		add:
			(PRHeader new
				level: 2;
				add: (PRText content: anotherString));
		yourself.

	self assert: (self executePhase: input with: configuration) equals: expected.
	