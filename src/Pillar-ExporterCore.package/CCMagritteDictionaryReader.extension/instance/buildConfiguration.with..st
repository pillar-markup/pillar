*Pillar-ExporterCore
buildConfiguration: confName with: confValues
	| outputType |
	outputType := confValues at: 'outputType' ifAbsent: nil.
	configuration class
		allSubclassesDo: [ :e | 
			e isAbstract
				ifFalse: [ 
					(e configurationName = confName or: [ e configurationName = outputType ])
						ifTrue: [ | subconfiguration |
							subconfiguration := e new.
							subconfiguration parent: configuration.
							CCMagritteDictionaryReader writeDictionary: confValues toConfiguration: subconfiguration.
							^ subconfiguration ] ] ].
	^ self createConfigurationFrom: confValues