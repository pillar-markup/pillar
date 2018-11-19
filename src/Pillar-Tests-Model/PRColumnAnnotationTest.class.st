Class {
	#name : #PRColumnAnnotationTest,
	#superclass : #PRAbstractAnnotationTest,
	#category : 'Pillar-Tests-Model-Document'
}

{ #category : #helpers }
PRColumnAnnotationTest >> actualClass [
	^ PRColumnAnnotation
]

{ #category : #helpers }
PRColumnAnnotationTest >> referenceParameters [
	^ PRParameters withAll: { 
		PRParameter 
			keyNode: (PRParameterKey named: 'width')
			valueNode: (PRParameterValue value: 50) }
]

{ #category : #helpers }
PRColumnAnnotationTest >> referenceString [
	^ 'column:width=50'
]
