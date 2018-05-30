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
	^ OrderedDictionary new
		add: 'title' -> 'Foo';
		add: 'label' -> 'Tintin';
 		yourself
]

{ #category : #helpers }
PRSlideTitleAnnotationTest >> referenceString [
	^ 'slide:Foo|label=Tintin'
]
