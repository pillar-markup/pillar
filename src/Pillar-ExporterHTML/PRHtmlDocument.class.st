Class {
	#name : 'PRHtmlDocument',
	#superclass : 'PRAbstractOutputDocument',
	#category : 'Pillar-ExporterHTML',
	#package : 'Pillar-ExporterHTML'
}

{ #category : 'accessing' }
PRHtmlDocument >> basicWriter [
	
	"| kindOfWriter inPillar |
	
	
 	inPillar := PRDocumentWriter allSubclasses 
		detect: [ :each | each isAbstract not
			and: [ each writerName = kindOfWriter ] ]
		ifNone: [ self halt. ].		
	^ inPillar new		
	"
	| kindOfWriter |
	kindOfWriter := (project configuration propertyAt: #htmlWriter).
	
	^ (((SystemNavigation default allImplementorsOf: #writerName) 
		collect: [ :each | each methodClass instanceSide ]) 
			 detect: [ :each | 	each isAbstract not 
						and: [ each writerName asLowercase = kindOfWriter asLowercase ] ]) new
]

{ #category : 'accessing' }
PRHtmlDocument >> extension [
	
	^ 'html'
]

{ #category : 'building' }
PRHtmlDocument >> getMustacheTemplateValuesFromDocument: aDocument [
	"aDocument already has a dictionary holding potential metadata. 
	We add the text contents to the dictionary.
	This dictionary will be used by the mustache."
	
	| template |
	template := super getMustacheTemplateValuesFromDocument: aDocument.
	"
	Removed Toc management but keep it since I will revuild it soon
	template 
		at: #toc 
		put: (self tableOfContents asCTEnvironmentWithParent: template)."
	^ template
]
