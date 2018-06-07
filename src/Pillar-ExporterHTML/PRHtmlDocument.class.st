Class {
	#name : #PRHtmlDocument,
	#superclass : #PRAbstractOutputDocument,
	#category : 'Pillar-ExporterHTML'
}

{ #category : #accessing }
PRHtmlDocument >> extension [
	
	^ 'html'
]

{ #category : #building }
PRHtmlDocument >> getMustacheTemplateValuesFromDocument: aDocument [
	| template |
	"We get the flattened meta-data obtained from the file header and the pillar configuration
	We add the text contents to the dictionary.
	This dictionary will be used by the mustache"
	template := super getMustacheTemplateValuesFromDocument: aDocument.
	template at: #toc put: self tableOfContents asDictionary.
	(template at: #toc)
		at: #parent put: template;
		yourself.
	^ template
]

{ #category : #accessing }
PRHtmlDocument >> writer [
	
	^ (PRDocumentWriter allSubclasses detect: [ :each | 
		each isAbstract not
			and: [ each writerName = (project configuration propertyAt: #htmlWriter) ] ])
				new
]
