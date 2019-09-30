"
I am a footnote, you can create me with :

noted: aString

It create a footnote with note specified in parameter.
"
Class {
	#name : #PRFootnote,
	#superclass : #PRDocumentItem,
	#instVars : [
		'note'
	],
	#category : #'Pillar-Model-Document'
}

{ #category : #testing }
PRFootnote class >> isAbstract [
	^ false
]

{ #category : #'instance creation' }
PRFootnote class >> noted: aString [
	^ self new note: aString.
]

{ #category : #visiting }
PRFootnote >> accept: aVisitor [
	^ aVisitor visitFootnote: self.
]

{ #category : #accessing }
PRFootnote >> note [
	^ note
]

{ #category : #accessing }
PRFootnote >> note: aString [
	note := aString
]
