Class {
	#name : #PRMockAnnotationTest,
	#superclass : #PRAbstractAnnotationTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #helpers }
PRMockAnnotationTest >> actualClass [
	^ PRMockAnnotation
]

{ #category : #helpers }
PRMockAnnotationTest >> referenceParameters [
	^ PRParameters withAll: { 
		PRParameter 
			keyNode: (PRParameterKey named: 'value')
			valueNode: (PRParameterValue value: 'Foo').
		PRParameter 
			keyNode: (PRParameterKey named: 'number')
			valueNode: (PRParameterValue value: 5) }
]

{ #category : #helpers }
PRMockAnnotationTest >> referenceString [
	^ 'mock:value=Foo|number=5'
]
