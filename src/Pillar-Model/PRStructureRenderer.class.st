"
I am a render class for Structures.

"
Class {
	#name : #PRStructureRenderer,
	#superclass : #PRObject,
	#category : 'Pillar-Model-Feature - structures'
}

{ #category : #'as yet unclassified' }
PRStructureRenderer class >> isAbstract [
	^ self = PRStructureRenderer 
]

{ #category : #rendering }
PRStructureRenderer >> renderFor: aStructure [
	^ self subclassResponsibility 
]
