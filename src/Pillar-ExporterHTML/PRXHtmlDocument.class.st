Class {
	#name : 'PRXHtmlDocument',
	#superclass : 'PRHtmlDocument',
	#category : 'Pillar-ExporterHTML',
	#package : 'Pillar-ExporterHTML'
}

{ #category : 'accessing' }
PRXHtmlDocument >> basicWriter [
	self halt.
	
	^ self "was PRXHTMLWriter new"
]

{ #category : 'accessing' }
PRXHtmlDocument >> extension [

	^ 'xhtml'
]
