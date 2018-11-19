Class {
	#name : #PRSlideTitleAnnotationTest,
	#superclass : #PRAbstractAnnotationTest,
	#category : 'Pillar-Tests-Model-Document'
}

{ #category : #helpers }
PRSlideTitleAnnotationTest >> actualClass [
	^ PRSlideTitleAnnotation
]

{ #category : #helpers }
PRSlideTitleAnnotationTest >> referenceParameters [
	^ PRParameters withAll: { 
		PRParameter 
			keyNode: (PRParameterKey named: 'title')
			valueNode: (PRParameterValue value: 'Foo').
		PRParameter 
			keyNode: (PRParameterKey named: 'label')
			valueNode: (PRParameterValue value: 'Tintin') }
]

{ #category : #helpers }
PRSlideTitleAnnotationTest >> referenceString [
	^ 'slide:title=Foo|label=Tintin'
]
