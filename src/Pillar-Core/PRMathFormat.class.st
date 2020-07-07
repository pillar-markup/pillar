"
I'm a first cut to support math in text. 
In the future I could be a subclass of PRAbstractAnnotation if we need to specify argument
but this is not clear. 
I do not have a Pillar syntax but in Microdown I'm represented by `$1 + 2$`.
"
Class {
	#name : #PRMathFormat,
	#superclass : #PRFormat,
	#category : #'Pillar-Core-Model'
}

{ #category : #visiting }
PRMathFormat >> accept: aVisitor [
	^ aVisitor visitMathFormat: self
]
