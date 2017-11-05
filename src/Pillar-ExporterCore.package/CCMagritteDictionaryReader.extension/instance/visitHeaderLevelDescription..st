*Pillar-ExporterCore
visitHeaderLevelDescription: aHeaderLevelDescription
	self
		tryToAddFrom: aHeaderLevelDescription
		withInterpretation: [ :value | 
			| return |
			return := (configuration class headerConfigurations at: (value at: 'renderAs' ifAbsent: [ 'roman' ])) with: value.
			return
				level: aHeaderLevelDescription level;
				configuration: configuration.
			return ]