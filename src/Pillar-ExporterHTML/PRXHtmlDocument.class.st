Class {
	#name : #PRXHtmlDocument,
	#superclass : #PRHtmlDocument,
	#category : 'Pillar-ExporterHTML'
}

{ #category : #accessing }
PRXHtmlDocument >> extension [

	^ 'xhtml'
]

{ #category : #accessing }
PRXHtmlDocument >> writer [
	
	^ PRXHTMLWriter new
]
