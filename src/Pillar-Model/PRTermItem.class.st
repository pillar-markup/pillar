"
A term (to be renamed) is the label part into definition list. It is delimited by ; i.e., blue and red below

;blue.
:color of the sky
;red.
:color of the fire

generates

blue.
color of the sky
red.
color of the fire
"
Class {
	#name : #PRTermItem,
	#superclass : #PRListItem,
	#category : #'Pillar-Model-Document'
}

{ #category : #visiting }
PRTermItem >> accept: aVisitor [
	^ aVisitor visitTermItem: self
]
