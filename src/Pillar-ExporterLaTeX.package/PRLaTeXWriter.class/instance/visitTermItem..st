visiting-document
visitTermItem: anItem
	canvas command
		name: 'item';
		optParameter: [ self visitAll: anItem children ].
	canvas space.