Class {
	#name : #PRSectionTest,
	#superclass : #PRDocumentGroupTest,
	#category : 'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRSectionTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRSectionTest >> actualClass [
	^ PRSection
]
