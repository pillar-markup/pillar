comparing
compareChildren: anItem
	^ (self children with: anItem children collect: [ :elem1 :elem2 | elem1 = elem2 ])
		inject: true
		into: [ :res :elem | res & elem ]