Class {
	#name : 'PRHtmlDocument',
	#superclass : 'PRAbstractOutputDocument',
	#category : 'Pillar-ExporterHTML',
	#package : 'Pillar-ExporterHTML'
}

{ #category : 'accessing' }
PRHtmlDocument >> basicWriter [

	^ (((SystemNavigation default allImplementorsOf: #writerName)
		    collect: [ :each | each methodClass instanceSide ]) detect: [
			   :each |
			   each isAbstract not and: [
					   each writerName asLowercase
					   = (project configuration propertyAt: #htmlWriter) asLowercase ] ])
		  new
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
	template 
		at: #toc 
		put: (self tableOfContents asCTEnvironmentWithParent: template).
	^ template
]
