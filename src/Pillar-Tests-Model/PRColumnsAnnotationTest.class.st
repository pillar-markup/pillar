Class {
	#name : #PRColumnsAnnotationTest,
	#superclass : #PRAbstractAnnotationTest,
	#category : 'Pillar-Tests-Model-Document'
}

{ #category : #helpers }
PRColumnsAnnotationTest >> actualClass [
	^ PRBeginColumnsAnnotation
]

{ #category : #helpers }
PRColumnsAnnotationTest >> referenceParameters [
	^ PRParameters new
]

{ #category : #helpers }
PRColumnsAnnotationTest >> referenceString [
	^ 'columns'
]
