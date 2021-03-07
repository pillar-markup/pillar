Class {
	#name : #PREndEnvironmentAnnotationTest4,
	#superclass : #PRAbstractAnnotationTest4,
	#category : #'Pillar-Tests-Core'
}

{ #category : #helpers }
PREndEnvironmentAnnotationTest4 >> actualClass [
	^ PREndEnvironmentAnnotation
]

{ #category : #helpers }
PREndEnvironmentAnnotationTest4 >> referenceParameters [
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
PREndEnvironmentAnnotationTest4 >> referenceString [
	^ 'end:name=card|number=10|string=a string|boolean=true'
]
