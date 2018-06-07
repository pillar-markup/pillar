"
I render structures as a Definition List.
"
Class {
	#name : #PRDefinitionListRenderer,
	#superclass : #PRStructureRenderer,
	#category : 'Pillar-Model-Feature - structures'
}

{ #category : #rendering }
PRDefinitionListRenderer >> renderFor: aStructure [
	| list |
	list := PRDefinitionList new.
	aStructure structDict keys
		do: [ :each | 
			list
				add: (PRTermItem with: (PRText new text: each));
				add: (PRDataItem with: (PRText new text: (aStructure structDict at: each))) ].
	^ list
]
