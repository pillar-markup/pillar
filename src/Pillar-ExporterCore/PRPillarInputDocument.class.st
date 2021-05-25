Class {
	#name : #PRPillarInputDocument,
	#superclass : #PRInputDocument,
	#category : #'Pillar-ExporterCore-Base'
}

{ #category : #registration }
PRPillarInputDocument class >> doesHandleExtension: anExtension [

	^ anExtension = 'pillar'
]

{ #category : #accessing }
PRPillarInputDocument >> parsedDocument [

	^ self parserClass parse: file
]

{ #category : #accessing }
PRPillarInputDocument >> parserClass [
	
	^ PRDocument parser 
]
