"
I am an annotation that mark a footnote

My tag is 'footnote'
My parameters are :
- note=aString

 
"
Class {
	#name : #PRFootnoteAnnotation,
	#superclass : #PRAbstractAnnotation,
	#category : #'Pillar-Model-Document'
}

{ #category : #accessing }
PRFootnoteAnnotation class >> possibleParameters [

	^ #(note)
]

{ #category : #protected }
PRFootnoteAnnotation class >> tag [
	^ #footnote
]

{ #category : #visiting }
PRFootnoteAnnotation >> accept: aVisitor [
	^ aVisitor visitFootnoteAnnotation: self
]

{ #category : #descriptions }
PRFootnoteAnnotation >> asPillarParametersOn: aStream [
	self parameters
		at: 'note'
		ifPresent: [ :v | 
			self asPillarKey: 'note' value: v asString on: aStream ]
]
