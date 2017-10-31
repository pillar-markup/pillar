activation
activate
	| confFilename |
	self activateHelp
		ifTrue: [ ^ self ].
	confFilename := self optionAt: 'configurationFile' ifAbsent: [ self class defaultConfigurationFileName ].
	self optionAt: 'baseDirectory' ifPresent: [ :dir | baseDirectory := dir asFileReference ].
	configurationInstaller 
			createConfiguration: confFilename 
			baseDirectory: self baseDirectory 
			argDictionary: self argumentsForConfigurationExtension.