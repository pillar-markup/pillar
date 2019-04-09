Class {
	#name : #PRBeginEnvironmentAnnotation,
	#superclass : #PRAbstractAnnotation,
	#category : #'Pillar-Model-Document'
}

{ #category : #'instance creation' }
PRBeginEnvironmentAnnotation class >> named: aString [ 
	^ self new name: aString; yourself
]

{ #category : #testing }
PRBeginEnvironmentAnnotation class >> possibleParameters [
	^ #(name)
]

{ #category : #protected }
PRBeginEnvironmentAnnotation class >> tag [
	^ #begin
]

{ #category : #visiting }
PRBeginEnvironmentAnnotation >> accept: aVisitor [
	aVisitor visitBeginEnvironmentAnnotation: self
]

{ #category : #accessing }
PRBeginEnvironmentAnnotation >> name: aString [ 
	
	self parameters at: 'name' put: aString
]
