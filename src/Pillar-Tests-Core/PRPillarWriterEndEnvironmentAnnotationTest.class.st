Class {
	#name : #PRPillarWriterEndEnvironmentAnnotationTest,
	#superclass : #PRAbstractPillarWriterAnnotationTest,
	#category : #'Pillar-Tests-Core-PillarWriter'
}

{ #category : #private }
PRPillarWriterEndEnvironmentAnnotationTest >> actualClass [
	^ PREndEnvironmentAnnotation
]

{ #category : #helpers }
PRPillarWriterEndEnvironmentAnnotationTest >> referenceParameters [
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

{ #category : #private }
PRPillarWriterEndEnvironmentAnnotationTest >> referenceString [
	^ 'end:name=card|number=10|string=a string|boolean=true'
]
