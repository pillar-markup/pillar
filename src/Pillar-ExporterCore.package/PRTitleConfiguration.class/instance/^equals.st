comparing
= anObject
	^ self species = anObject species
		and: [ self predecessor = anObject predecessor and: [ self numbering = anObject numbering and: [ self size = anObject size ] ] ]