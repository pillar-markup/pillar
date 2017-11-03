accessing
buildConfiguration

	| confFileReference |
	confFileReference := workingDirectory / configurationFileName.
	
	confFileReference exists ifFalse: [
		self error: 'ConfigurationFile ', configurationFileName, ' does not exist in path ', workingDirectory fullName.
	].

	
	"We set the base diretory as an extended property and not afterwards.
	Otherwise the file is loaded before and all properties are resolved EAGERLY with the default base directory: the working directory.
	This is wrong particularly for Pharo <=6 where the working directory is not correctly set."
	^ PRPillarConfiguration 
			newFromFile: confFileReference
			extendedWith: (extraArguments copyWith: ('baseDirectory' -> confFileReference))