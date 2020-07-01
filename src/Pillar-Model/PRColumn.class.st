"
I am a column.
"
Class {
	#name : #PRColumn,
	#superclass : #PRDocumentGroup,
	#instVars : [
		'width'
	],
	#category : #'Pillar-Model-Document'
}

{ #category : #'instance creation' }
PRColumn class >> width: aNumber [
	^ self new
		width: aNumber;
		yourself
]

{ #category : #visiting }
PRColumn >> accept: aVisitor [
	^ aVisitor visitColumn: self
]

{ #category : #accessing }
PRColumn >> width [
	^ width
]

{ #category : #accessing }
PRColumn >> width: anObject [
	width := anObject
]
