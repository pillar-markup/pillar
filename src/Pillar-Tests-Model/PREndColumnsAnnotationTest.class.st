Class {
	#name : #PREndColumnsAnnotationTest,
	#superclass : #PRAbstractAnnotationTest,
	#category : 'Pillar-Tests-Model-Document'
}

{ #category : #helpers }
PREndColumnsAnnotationTest >> actualClass [
	^ PREndColumnsAnnotation
]

{ #category : #helpers }
PREndColumnsAnnotationTest >> referenceParameters [
	^ PRParameters new
]

{ #category : #helpers }
PREndColumnsAnnotationTest >> referenceString [
	^ 'endColumns'
]
