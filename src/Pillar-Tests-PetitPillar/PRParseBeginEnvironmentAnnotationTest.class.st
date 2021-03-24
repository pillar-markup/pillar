Class {
	#name : #PRParseBeginEnvironmentAnnotationTest,
	#superclass : #PRParseAbstractAnnotationTest,
	#category : #'Pillar-Tests-PetitPillar'
}

{ #category : #helpers }
PRParseBeginEnvironmentAnnotationTest >> actualClass [
	^ PRBeginEnvironmentAnnotation
]

{ #category : #helpers }
PRParseBeginEnvironmentAnnotationTest >> referenceParameters [
	^ PRParameters withAll: { 
		PRParameter 
			keyNode: (PRParameterKey named: 'name')
			valueNode: (PRParameterValue value: 'card').
		PRParameter 
			keyNode: (PRParameterKey named: 'number')
			valueNode: (PRParameterValue value: 10).
		PRParameter 
			keyNode: (PRParameterKey named: 'string')
			valueNode: (PRParameterValue value: 'a string').
		PRParameter 
			keyNode: (PRParameterKey named: 'boolean')
			valueNode: (PRParameterValue value: true).
		}
]

{ #category : #helpers }
PRParseBeginEnvironmentAnnotationTest >> referenceString [
	^ 'begin:name=card|number=10|string=a string|boolean=true'
]
