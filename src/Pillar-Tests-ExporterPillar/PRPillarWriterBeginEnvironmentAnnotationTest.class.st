Class {
	#name : #PRPillarWriterBeginEnvironmentAnnotationTest,
	#superclass : #PRPillarWriterAbstractAnnotationTest,
	#category : #'Pillar-Tests-ExporterPillar'
}

{ #category : #private }
PRPillarWriterBeginEnvironmentAnnotationTest >> actualClass [
	^ PRBeginEnvironmentAnnotation
]

{ #category : #helpers }
PRPillarWriterBeginEnvironmentAnnotationTest >> referenceParameters [
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
PRPillarWriterBeginEnvironmentAnnotationTest >> referenceString [
	^ 'begin:name=card|number=10|string=a string|boolean=true'
]
