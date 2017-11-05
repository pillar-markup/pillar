visiting-document
visitOrderedList: aList
	canvas tag
		name: 'ol';
		with: [ super visitOrderedList: aList ].
	canvas newLine