api
createConfiguration: confFilename baseDirectory: baseDirectoryArg argDictionary: arguments
	| confFile |
	baseDirectory := baseDirectoryArg.
	confFile := baseDirectory resolve: confFilename.
	configuration := confFile exists
		ifTrue: [ [ (PRPillarConfiguration 
							newFromFile: confFile 
							extendedWith: arguments)
							baseDirectory: baseDirectoryArg ]
						on: STONReaderError
						do: [ :error | Exit signalFailure: error messageText ]  ]
		ifFalse: [ PRPillarConfiguration newFromDictionary: arguments ]