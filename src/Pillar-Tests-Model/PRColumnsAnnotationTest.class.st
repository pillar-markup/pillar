Class {
	#name : 'PRColumnsAnnotationTest',
	#superclass : 'PRAbstractAnnotationTest',
	#category : 'Pillar-Tests-Model-Document',
	#package : 'Pillar-Tests-Model',
	#tag : 'Document'
}

{ #category : 'helpers' }
PRColumnsAnnotationTest >> actualClass [
	^ PRBeginColumnsAnnotation
]

{ #category : 'helpers' }
PRColumnsAnnotationTest >> referenceParameters [
	^ PRParameters new
]

{ #category : 'helpers' }
PRColumnsAnnotationTest >> referenceString [
	^ 'columns'
]
