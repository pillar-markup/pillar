helpers
testTemplateForDefaultValueForCapitalization: aString
	| input printer spec configuration |
	configuration := self configuration.
	printer := configuration printer. 
	spec := printer printerSpecFor: 'roman' .
	printer level2: spec. 
	
	input := PRDocument new
		add:
			(PRHeader new
				level: 2;
				add: (PRText content: aString));
		yourself.
	self assert: (self executePhase: input with: configuration) equals: input