rendering
renderFor: aStructure
	| list |
	list := PRDefinitionList new.
	aStructure structDict keys
		do: [ :each | 
			list
				add: (PRTermItem with: (PRText new text: each));
				add: (PRDataItem with: (PRText new text: (aStructure structDict at: each))) ].
	^ list