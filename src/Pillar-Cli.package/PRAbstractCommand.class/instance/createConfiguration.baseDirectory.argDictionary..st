api
createConfiguration: confFilename baseDirectory: baseDirectoryArg argDictionary: arguments
	| confFile |
	baseDirectory := baseDirectoryArg.
	confFile := baseDirectory resolve: confFilename.
	configuration := confFile exists
		ifTrue: [ [ 
				"We set the base diretory as an extended property and not afterwards.
				Otherwise the file is loaded before and all properties are resolved EAGERLY with the default base directory: the working directory.
				This is wrong particularly for Pharo <=6 where the working directory is not correctly set."
				ConfigurationForPillar 
							newFromFile: confFile 
							extendedWith: (arguments
								copyWith: ('baseDirectory' -> baseDirectoryArg))]
						on: STONReaderError
						do: [ :error | Exit signalFailure: error messageText ]  ]
		ifFalse: [ ConfigurationForPillar newFromDictionary: arguments ]