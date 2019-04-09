Class {
	#name : #PRBeginEnvironmentAnnotation,
	#superclass : #PRAbstractAnnotation,
	#category : #'Pillar-Model-Document'
}

{ #category : #testing }
PRBeginEnvironmentAnnotation class >> hasParameters [

	^ false
]

{ #category : #testing }
PRBeginEnvironmentAnnotation class >> possibleParameters [
	^ #()
]

{ #category : #protected }
PRBeginEnvironmentAnnotation class >> tag [
	^ #columns
]

{ #category : #visiting }
PRBeginEnvironmentAnnotation >> accept: aVisitor [
	aVisitor visitBeginEnvironmentAnnotation: self
]
