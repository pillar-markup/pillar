Class {
	#name : #PRParseEndEnvironmentAnnotationTest,
	#superclass : #PRParseAbstractAnnotationTest,
	#category : #'Pillar-Tests-Core-Parse'
}

{ #category : #helpers }
PRParseEndEnvironmentAnnotationTest >> actualClass [
	^ PREndEnvironmentAnnotation
]

{ #category : #helpers }
PRParseEndEnvironmentAnnotationTest >> referenceParameters [
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
PRParseEndEnvironmentAnnotationTest >> referenceString [
	^ 'end:name=card|number=10|string=a string|boolean=true'
]
