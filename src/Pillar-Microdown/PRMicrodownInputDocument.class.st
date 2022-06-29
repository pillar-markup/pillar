Class {
	#name : #PRMicrodownInputDocument,
	#superclass : #PRInputDocument,
	#category : #'Pillar-Microdown'
}

{ #category : #registration }
PRMicrodownInputDocument class >> doesHandleExtension: anExtension [

	^ anExtension = 'mic'
]

{ #category : #accessing }
PRMicrodownInputDocument >> parsedDocument [

	^ (self parserClass parse: file contents) asPillar
]

{ #category : #accessing }
PRMicrodownInputDocument >> parserClass [
	^ MicrodownParser
]
