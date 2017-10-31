visiting-document
visitOrderedList: aList
	canvas environment
		name: 'enumerate';
		with: [ super visitOrderedList: aList ]