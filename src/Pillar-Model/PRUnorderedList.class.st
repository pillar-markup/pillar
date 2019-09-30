"
I am an unordered list. I am typically used for unnumbered lists
"
Class {
	#name : #PRUnorderedList,
	#superclass : #PRList,
	#category : #'Pillar-Model-Document'
}

{ #category : #testing }
PRUnorderedList class >> isAbstract [
	^ false
]

{ #category : #visiting }
PRUnorderedList >> accept: aVisitor [
	^ aVisitor visitUnorderedList: self
]
