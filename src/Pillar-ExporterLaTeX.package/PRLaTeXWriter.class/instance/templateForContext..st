templating
templateForContext: aPillarContext

	| inputFile templateName |
	configuration := aPillarContext configuration.
	inputFile := configuration inputFile.

	templateName := inputFile fullName = ((configuration baseDirectory resolve: configuration mainDocument), 'pillar') fullName
		ifTrue: [ self mainDocumentTemplateName ]
		ifFalse: [ self chapterTemplateName ].
		
	^ configuration propertyAt: templateName