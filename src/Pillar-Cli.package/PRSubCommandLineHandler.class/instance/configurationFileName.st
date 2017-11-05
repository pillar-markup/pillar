accessing
configurationFileName

	^ self
		optionAt: 'configurationFile'
		ifAbsent: [ self class defaultConfigurationFileName ]