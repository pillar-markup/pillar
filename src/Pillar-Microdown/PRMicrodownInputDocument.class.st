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
PRMicrodownInputDocument >> parserClass [
	^ MicroDownParser
]
