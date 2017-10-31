actions
export: aConfigurationName
	self log: 'Exporting ' , aConfigurationName.
	(self getConfigurationNamed: aConfigurationName) export.
	self log: 'End of exporting ' , aConfigurationName