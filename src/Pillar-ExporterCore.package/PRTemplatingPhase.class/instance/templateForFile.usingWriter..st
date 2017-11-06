templating
templateForFile: aFileReference usingWriter: aWriter
	
	| templateName |
	templateName := aFileReference fullName = ((self configuration baseDirectory resolve: self configuration mainDocument), 'pillar') fullName
		ifTrue: [ aWriter mainDocumentTemplateName ]
		ifFalse: [ aWriter chapterTemplateName ].
		
	^ self configuration propertyAt: templateName