Class {
	#name : #PRPraseEndEnvironmentAnnotationTest,
	#superclass : #PRParseAbstractAnnotationTest,
	#category : #'Pillar-Tests-Core'
}

{ #category : #helpers }
PRPraseEndEnvironmentAnnotationTest >> actualClass [
	^ PREndEnvironmentAnnotation
]

{ #category : #helpers }
PRPraseEndEnvironmentAnnotationTest >> referenceParameters [
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
PRPraseEndEnvironmentAnnotationTest >> referenceString [
	^ 'end:name=card|number=10|string=a string|boolean=true'
]
