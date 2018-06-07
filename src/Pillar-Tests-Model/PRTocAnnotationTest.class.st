Class {
	#name : #PRTocAnnotationTest,
	#superclass : #PRAbstractAnnotationTest,
	#category : 'Pillar-Tests-Model-Document'
}

{ #category : #helpers }
PRTocAnnotationTest >> actualClass [
	^ PRTocAnnotation
]

{ #category : #helpers }
PRTocAnnotationTest >> referenceParameters [
	^ OrderedDictionary new
		add: 'depthLevel' -> '2';
		add: 'level' -> '3';
		yourself
]

{ #category : #helpers }
PRTocAnnotationTest >> referenceString [
	^ 'toc:depthLevel=2|level=3'
]
