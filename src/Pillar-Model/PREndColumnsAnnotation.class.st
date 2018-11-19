"
I am an annotation that mark the end of a columns environement.

My tag is: 'endColumns'.

!! Example
Check example in PRColumnAnnotation.
"
Class {
	#name : #PREndColumnsAnnotation,
	#superclass : #PRAbstractAnnotation,
	#category : 'Pillar-Model-Document'
}

{ #category : #testing }
PREndColumnsAnnotation class >> hasParameters [

	^ false
]

{ #category : #protected }
PREndColumnsAnnotation class >> possibleParameters [
	^ #()
]

{ #category : #protected }
PREndColumnsAnnotation class >> tag [ 
	^ #endColumns
]

{ #category : #visiting }
PREndColumnsAnnotation >> accept: aVisitor [
	aVisitor visitEndColumnsAnnotation: self
]
