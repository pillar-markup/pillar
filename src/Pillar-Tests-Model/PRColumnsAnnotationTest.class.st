Class {
	#name : #PRColumnsAnnotationTest,
	#superclass : #PRAbstractAnnotationTest,
	#category : 'Pillar-Tests-Model-Document'
}

{ #category : #helpers }
PRColumnsAnnotationTest >> actualClass [
	^ PRColumnsAnnotation
]

{ #category : #helpers }
PRColumnsAnnotationTest >> referenceParameters [
	^ OrderedDictionary new
]

{ #category : #helpers }
PRColumnsAnnotationTest >> referenceString [
	^ 'columns'
]
