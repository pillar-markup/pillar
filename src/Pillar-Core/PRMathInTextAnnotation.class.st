"
Mockup of the annotation for math in text. We do not have a syntax from the pillar side 
but this is for microdown. 
We will have to fix this.
"
Class {
	#name : #PRMathInTextAnnotation,
	#superclass : #PRAbstractAnnotation,
	#category : #'Pillar-Core'
}

{ #category : #protected }
PRMathInTextAnnotation class >> tag [
	"For now this is unclear how we will manage it. This is just to make sure that microdown mathInText is converted"
	^ #math
]

{ #category : #visiting }
PRMathInTextAnnotation >> accept: aVisitor [
	^ aVisitor visitMathInTextAnnotation: self
]
