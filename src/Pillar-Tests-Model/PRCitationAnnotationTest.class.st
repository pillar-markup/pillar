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
	^ OrderedDictionary new
		add: 'ref' -> 'hello';
		yourself
]

{ #category : #helpers }
PRCitationAnnotationTest >> referenceString [
	^ 'cite:ref=hello'
]
