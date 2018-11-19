"
I'm an object managing configuration. I'm usually invoked from a command line but not only.

My main entry point is 

	createConfiguration: confFilename baseDirectory: baseDirectory argDictionary: arguments

When you type on the command line
	
	./pharo-ui Pillar.image pillar export --to=""latex"" Chapters/Chapter1/chapter1.pillar
	
You can obtain the same doing; 

	PRExportBuilder new 	
		createConfiguration: 'pillar.conf' 
		baseDirectory:  FileSystem workingDirectory   
		argDictionary: {
				'inputFile'-> (FileSystem workingDirectory / 'Chapters/Chapter1/chapter1.pillar') .
				'defaultExporters' -> {'latex'}
				} asDictionary;
		export
		
"
Class {
	#name : #PRAbstractCommand,
	#superclass : #Object,
	#instVars : [
		'configuration',
		'baseDirectory',
		'configurationFileName',
		'workingDirectory',
		'extraArguments'
	],
	#category : 'Pillar-Cli-Model'
}

{ #category : #accessing }
PRAbstractCommand >> buildConfiguration [

	| confFileReference |
	confFileReference := workingDirectory / configurationFileName.
	
	confFileReference exists ifFalse: [
		self error: 'ConfigurationFile ', configurationFileName, ' does not exist in path ', workingDirectory fullName.
	].

	
	"We set the base diretory as an extended property and not afterwards.
	Otherwise the file is loaded before and all properties are resolved EAGERLY with the default base directory: the working directory.
	This is wrong particularly for Pharo <=6 where the working directory is not correctly set."
	^ ConfigurationForPillar 
			newFromFile: confFileReference
			extendedWith: (extraArguments copyWith: ('baseDirectory' -> workingDirectory))
]

{ #category : #accessing }
PRAbstractCommand >> configuration [

	^ configuration ifNil: [ 
		self configuration: self buildConfiguration.
		configuration ]
]

{ #category : #accessing }
PRAbstractCommand >> configuration: aConfiguration [

	configuration := aConfiguration
]

{ #category : #accessing }
PRAbstractCommand >> configurationFileName: aFileName [

	configurationFileName := aFileName
]

{ #category : #api }
PRAbstractCommand >> createConfiguration: confFilename baseDirectory: baseDirectoryArg argDictionary: arguments [
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
]

{ #category : #api }
PRAbstractCommand >> doIt [
	"by default does nothing. Now the relation with createConfiguration:... is not clear. 
	For example the PRArchetypeConfiguratioInstaller should probably not override the 
	createConfiguration: but define a doIt method performing the download and action."
]

{ #category : #accessing }
PRAbstractCommand >> extraArguments: aDictionary [

	extraArguments := aDictionary
]

{ #category : #accessing }
PRAbstractCommand >> workingDirectory: aDirectory [

	workingDirectory := aDirectory
]
