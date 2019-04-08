Class {
	#name : #PREndEnvironmentAnnotation,
	#superclass : #PRAbstractAnnotation,
	#category : #'Pillar-Model-Document'
}

{ #category : #testing }
PREndEnvironmentAnnotation class >> hasParameters [

	^ false
]

{ #category : #protected }
PREndEnvironmentAnnotation class >> possibleParameters [
	^ #()
]

{ #category : #protected }
PREndEnvironmentAnnotation class >> tag [ 
	^ #endColumns
]

{ #category : #visiting }
PREndEnvironmentAnnotation >> accept: aVisitor [
	aVisitor visitEndColumnsAnnotation: self
]
