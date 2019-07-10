Class {
	#name : #PREnvironmentAnnotation,
	#superclass : #PRAbstractAnnotation,
	#category : #'Pillar-Model-Minimal'
}

{ #category : #'instance creation' }
PREnvironmentAnnotation class >> named: aString [ 
	
	^ self new name: aString; yourself
]

{ #category : #testing }
PREnvironmentAnnotation class >> possibleParameters [
	^ #(name)
]

{ #category : #testing }
PREnvironmentAnnotation class >> validateParameters: aPRParameters dictionary: parameters in: anInstance [

	"I do not do any validations.
	I allow arbitrary parameters that will be used by my transformers."
]

{ #category : #accessing }
PREnvironmentAnnotation >> name [

	^ self parameters at: 'name' ifAbsent: [ PREnvironmentMissedNamed signal ]
]

{ #category : #accessing }
PREnvironmentAnnotation >> name: aString [ 
	
	self parameters at: 'name' put: aString
]
