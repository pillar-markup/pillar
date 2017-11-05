configurations
getConfigurationNamed: aConfigurationName
	^ (self subConfigurationNamed: aConfigurationName) ifNil: [ self findDefaultConfigurationNamed: aConfigurationName ]