visiting-document
visitDefinitionList: aList
	canvas tag
		name: 'dl';
		with: [ super visitDefinitionList: aList ].
	canvas newLine