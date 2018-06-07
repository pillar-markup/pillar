"
I render Structures as a Table
"
Class {
	#name : #PRTableRenderer,
	#superclass : #PRStructureRenderer,
	#category : 'Pillar-Model-Feature - structures'
}

{ #category : #rendering }
PRTableRenderer >> renderFor: aStructure [
	| table |
	table := PRTable new.
	aStructure structDict keys
		do: [ :each | 
			table
				add:
					(PRTableRow new
						add: (PRTableCell with: (PRText new text: each));
						add: (PRTableCell with: (PRText new text: (aStructure structDict at: each)));
						yourself) ].
	^ table
]
