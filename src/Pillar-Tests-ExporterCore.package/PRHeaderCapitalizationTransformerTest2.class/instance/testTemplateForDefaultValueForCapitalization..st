helpers
testTemplateForDefaultValueForCapitalization: aString
	| input printer spec configuration |
	configuration := self configuration.
	"self addHeader: Dictionary new ofLevel: 2 to: config."
	printer := PRTitlePrinter new.
	spec := printer printerSpecFor: 'roman' .
	printer level2: spec. 
	configuration printer: printer. 
	
	input := PRDocument new
		add:
			(PRHeader new
				level: 2;
				add: (PRText content: aString));
		yourself.
	self assert: (self executePhase: input with: configuration) equals: input