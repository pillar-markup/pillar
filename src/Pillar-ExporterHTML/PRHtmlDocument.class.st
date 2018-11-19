Class {
	#name : #PRHtmlDocument,
	#superclass : #PRAbstractOutputDocument,
	#category : 'Pillar-ExporterHTML'
}

{ #category : #accessing }
PRHtmlDocument >> basicWriter [
	
	^ (PRDocumentWriter allSubclasses detect: [ :each | 
		each isAbstract not
			and: [ each writerName = (project configuration propertyAt: #htmlWriter) ] ])
				new
]

{ #category : #accessing }
PRHtmlDocument >> extension [
	
	^ 'html'
]

{ #category : #building }
PRHtmlDocument >> getMustacheTemplateValuesFromDocument: aDocument [
	"aDocument already has a dictionary holding potential metadata. 
	We add the text contents to the dictionary.
	This dictionary will be used by the mustache."
	
	| template |
	template := super getMustacheTemplateValuesFromDocument: aDocument.
	template 
		at: #toc 
		put: (self tableOfContents asCTEnvironmentWithParent: template).
	^ template
]
