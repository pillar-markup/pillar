Class {
	#name : #PREndEnvironmentAnnotation,
	#superclass : #PRAbstractAnnotation,
	#category : #'Pillar-Model-Document'
}

{ #category : #'instance creation' }
PREndEnvironmentAnnotation class >> named: aString [ 
	
	^ self new name: aString; yourself
]

{ #category : #protected }
PREndEnvironmentAnnotation class >> possibleParameters [
	^ #(name)
]

{ #category : #protected }
PREndEnvironmentAnnotation class >> tag [ 
	^ #endColumns
]

{ #category : #visiting }
PREndEnvironmentAnnotation >> accept: aVisitor [
	aVisitor visitEndEnvironmentAnnotation: self
]

{ #category : #accessing }
PREndEnvironmentAnnotation >> name: aString [ 
	
	self parameters at: 'name' put: aString
]
