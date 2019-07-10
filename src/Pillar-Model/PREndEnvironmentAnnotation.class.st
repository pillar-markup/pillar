Class {
	#name : #PREndEnvironmentAnnotation,
	#superclass : #PREnvironmentAnnotation,
	#category : #'Pillar-Model-Minimal'
}

{ #category : #protected }
PREndEnvironmentAnnotation class >> tag [ 
	^ #end
]

{ #category : #visiting }
PREndEnvironmentAnnotation >> accept: aVisitor [
	aVisitor visitEndEnvironmentAnnotation: self
]
