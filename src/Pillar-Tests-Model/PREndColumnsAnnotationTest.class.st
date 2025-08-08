Class {
	#name : 'PREndColumnsAnnotationTest',
	#superclass : 'PRAbstractAnnotationTest',
	#category : 'Pillar-Tests-Model-Document',
	#package : 'Pillar-Tests-Model',
	#tag : 'Document'
}

{ #category : 'helpers' }
PREndColumnsAnnotationTest >> actualClass [
	^ PREndColumnsAnnotation
]

{ #category : 'helpers' }
PREndColumnsAnnotationTest >> referenceParameters [
	^ PRParameters new
]

{ #category : 'helpers' }
PREndColumnsAnnotationTest >> referenceString [
	^ 'endColumns'
]
