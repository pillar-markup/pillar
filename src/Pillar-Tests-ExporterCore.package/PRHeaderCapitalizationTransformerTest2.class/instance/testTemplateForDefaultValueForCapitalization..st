helpers
testTemplateForDefaultValueForCapitalization: aString
	| input printer spec |
	"self addHeader: Dictionary new ofLevel: 2 to: config."
	printer := PRTitlePrinter new.
	spec := printer printerSpecFor: 'roman' .
	printer level2: spec. 

	input := PRDocument new
		add:
			(PRHeader new
				level: 2;
				add: (PRText content: aString));
		yourself.
	self assert: (self executePhase: input with: printer) equals: input