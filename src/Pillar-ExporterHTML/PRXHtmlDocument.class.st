Class {
	#name : 'PRXHtmlDocument',
	#superclass : 'PRHtmlDocument',
	#category : 'Pillar-ExporterHTML',
	#package : 'Pillar-ExporterHTML'
}

{ #category : 'accessing' }
PRXHtmlDocument >> basicWriter [
	
	^ PRXHTMLWriter new
]

{ #category : 'accessing' }
PRXHtmlDocument >> extension [

	^ 'xhtml'
]
