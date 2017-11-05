creating
createStructureFrom: aScript
	^ PRStructure new
		tag: aScript structureName;
		structDict: (Json readFrom: aScript text readStream) asDictionary;
		yourself