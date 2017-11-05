parsing
parseInput: aFile
	^ PRCompilationContext
		withDocument:
			(aFile
				ifNil: [ self parse: FileStream stdin on: Array new ]
				ifNotNil: [ self parseFile: aFile ])
		withConfiguration: self configuration