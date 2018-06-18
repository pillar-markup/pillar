comparing
= anItem
	^ self species = anItem species
		and: [ self name = anItem name
				and: [ self level = anItem level and: [ self fileReference = anItem fileReference ] ] ]