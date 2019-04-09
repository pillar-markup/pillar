Class {
	#name : #PREnvironmentAnnotation,
	#superclass : #PRAbstractAnnotation,
	#category : #'Pillar-Model-Document'
}

{ #category : #'instance creation' }
PREnvironmentAnnotation class >> named: aString [ 
	
	^ self new name: aString; yourself
]

{ #category : #testing }
PREnvironmentAnnotation class >> possibleParameters [
	^ #(name)
]

{ #category : #accessing }
PREnvironmentAnnotation >> name [

	^ self parameters at: 'name' ifAbsent: [ PREnvironmentMissedNamed signal ]
]

{ #category : #accessing }
PREnvironmentAnnotation >> name: aString [ 
	
	self parameters at: 'name' put: aString
]
