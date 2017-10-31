visiting-document
visitTermItem: anItem
	canvas tag
		name: 'dt';
		with: [ self visitAll: anItem children ].
	canvas newLine