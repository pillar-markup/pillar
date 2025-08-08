Class {
	#name : 'PRPillarInputDocument',
	#superclass : 'PRInputDocument',
	#category : 'Pillar-ExporterCore-Removal candidates',
	#package : 'Pillar-ExporterCore',
	#tag : 'Removal candidates'
}

{ #category : 'registration' }
PRPillarInputDocument class >> doesHandleExtension: anExtension [

	^ anExtension = 'pillar'
]

{ #category : 'accessing' }
PRPillarInputDocument >> parsedDocument [

	^ self parserClass parse: file contents
]

{ #category : 'accessing' }
PRPillarInputDocument >> parserClass [
	
	^ PRDocument parser 
]
