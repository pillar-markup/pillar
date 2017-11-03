accessing
configurationWithExtraArguments: arguments

	| confFilename workingDirectory confFileReference |
	confFilename := self
		optionAt: 'configurationFile'
		ifAbsent: [ self class defaultConfigurationFileName ].
	
	
	workingDirectory := self
		optionAt: 'baseDirectory'
		ifPresent: [ :dir | workingDirectory := dir asFileReference ]
		ifAbsent: [ self error: 'Should specify #baseDirectory option through command line' ].

	
	confFileReference := workingDirectory / confFilename.
	
	confFileReference exists ifFalse: [
		self error: 'ConfigurationFile ', confFilename, ' does not exist in path ', workingDirectory fullName.
	].

	
	"We set the base diretory as an extended property and not afterwards.
	Otherwise the file is loaded before and all properties are resolved EAGERLY with the default base directory: the working directory.
	This is wrong particularly for Pharo <=6 where the working directory is not correctly set."
	^ PRPillarConfiguration 
			newFromFile: confFileReference
			extendedWith: (arguments copyWith: ('baseDirectory' -> confFileReference))