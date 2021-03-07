Class {
	#name : #PRBeginEnvironmentAnnotationTest4,
	#superclass : #PRAbstractAnnotationTest4,
	#category : #'Pillar-Tests-Core'
}

{ #category : #helpers }
PRBeginEnvironmentAnnotationTest4 >> actualClass [
	^ PRBeginEnvironmentAnnotation
]

{ #category : #helpers }
PRBeginEnvironmentAnnotationTest4 >> referenceParameters [
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
PRBeginEnvironmentAnnotationTest4 >> referenceString [
	^ 'begin:name=card|number=10|string=a string|boolean=true'
]
