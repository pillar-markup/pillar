visiting-document
visitUnorderedList: aList
	canvas environment
		name: 'itemize';
		with: [ super visitUnorderedList: aList ]