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
	^ OrderedDictionary new
]

{ #category : #helpers }
PREndColumnsAnnotationTest >> referenceString [
	^ 'endColumns'
]
