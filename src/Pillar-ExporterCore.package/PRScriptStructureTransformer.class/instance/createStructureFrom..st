creating
createStructureFrom: aScript
	^ PRStructure new
		tag: aScript structureName;
		structDict: (STON fromString: aScript text) asDictionary;
		yourself