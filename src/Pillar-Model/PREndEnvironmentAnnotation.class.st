Class {
	#name : #PREndEnvironmentAnnotation,
	#superclass : #PREnvironmentAnnotation,
	#category : #'Pillar-Model-Document'
}

{ #category : #protected }
PREndEnvironmentAnnotation class >> tag [ 
	^ #end
]

{ #category : #visiting }
PREndEnvironmentAnnotation >> accept: aVisitor [
	aVisitor visitEndEnvironmentAnnotation: self
]
