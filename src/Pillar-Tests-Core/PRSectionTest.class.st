Class {
	#name : #PRSectionTest,
	#superclass : #PRDocumentGroupTest,
	#category : #'Pillar-Tests-Core-Structural'
}

{ #category : #testing }
PRSectionTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRSectionTest >> actualClass [
	^ PRSection
]
