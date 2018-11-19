Class {
	#name : #PRCitationAnnotationTest,
	#superclass : #PRAbstractAnnotationTest,
	#category : 'Pillar-Tests-Model-Document'
}

{ #category : #helpers }
PRCitationAnnotationTest >> actualClass [
	^PRCitationAnnotation
]

{ #category : #helpers }
PRCitationAnnotationTest >> referenceParameters [
	^ PRParameters withAll: { 
		PRParameter 
			keyNode: (PRParameterKey named: 'ref')
			valueNode: (PRParameterValue value: 'hello') }
]

{ #category : #helpers }
PRCitationAnnotationTest >> referenceString [
	^ 'cite:ref=hello'
]
