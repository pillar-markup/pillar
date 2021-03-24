Class {
	#name : #PREndEnvironmentAnnotationTest,
	#superclass : #PRAbstractAnnotationTest,
	#category : #'Pillar-Tests-Core'
}

{ #category : #helpers }
PREndEnvironmentAnnotationTest >> actualClass [
	^ PREndEnvironmentAnnotation
]

{ #category : #helpers }
PREndEnvironmentAnnotationTest >> referenceParameters [
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
PREndEnvironmentAnnotationTest >> referenceString [
	^ 'end:name=card|number=10|string=a string|boolean=true'
]
