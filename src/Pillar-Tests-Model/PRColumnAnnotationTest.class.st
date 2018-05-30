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
	^ OrderedDictionary new
		add: 'width' -> '50';
		yourself
]

{ #category : #helpers }
PRColumnAnnotationTest >> referenceString [
	^ 'column:width=50'
]
