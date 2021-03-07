Class {
	#name : #PREndEnvironmentAnnotationTest3,
	#superclass : #PRAbstractAnnotationTest3,
	#category : #'Pillar-Tests-Core'
}

{ #category : #helpers }
PREndEnvironmentAnnotationTest3 >> actualClass [
	^ PREndEnvironmentAnnotation
]

{ #category : #helpers }
PREndEnvironmentAnnotationTest3 >> referenceParameters [
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
PREndEnvironmentAnnotationTest3 >> referenceString [
	^ 'end:name=card|number=10|string=a string|boolean=true'
]
