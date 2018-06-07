"
I represent the transformation of a structure.
I have a different render for each subclasses.
I can be referenced by a structure which wants to be transformed following my rule.
"
Class {
	#name : #PRStructureTransformer,
	#superclass : #PRNodeTransformer,
	#category : 'Pillar-ExporterCore-Feature-Structures'
}

{ #category : #'visiting-annotations' }
PRStructureTransformer >> transformClassFor: aStructureTag [

	^ self transformDictionary at: aStructureTag
]

{ #category : #'visiting-annotations' }
PRStructureTransformer >> transformDictionary [
	^ Dictionary
		with: 'exercise' -> PRDefinitionListRenderer
		with: 'city' -> PRTableRenderer
		with: 'country' -> PRTableRenderer
		with: 'default' -> PRTableRenderer
]

{ #category : #'visiting-annotations' }
PRStructureTransformer >> visitStructure: aStructure [
	| transformClass |
	transformClass := (self transformClassFor: aStructure tag) new.
	self replace: (OrderedCollection with: (transformClass  renderFor: aStructure))
]
