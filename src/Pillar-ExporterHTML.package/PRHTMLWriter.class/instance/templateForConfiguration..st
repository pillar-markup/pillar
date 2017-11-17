templating
templateForConfiguration: aConfiguration
	| inputFile templateName |
	configuration := aConfiguration.
	inputFile := configuration inputFile.
	
	(configuration hasProperty: #mainDocument)
		ifFalse: [ ^ configuration propertyAt: self mainDocumentTemplateName ].	
	
	templateName := inputFile fullName
		= ((configuration baseDirectory resolve: configuration mainDocument) , 'pillar') fullName
		ifTrue: [ self mainDocumentTemplateName ]
		ifFalse: [ self chapterTemplateName ].
	^ configuration propertyAt: templateName