activation
configurationFrom: confFilename
	| confFile |
	confFile := self baseDirectory resolve: confFilename.
	configuration := confFile exists
		ifTrue: [ [ (PRPillarConfiguration 
							newFromFile: confFile)
							baseDirectory:  self baseDirectory ]
						on: STONReaderError
						do: [ :error | Exit signalFailure: error messageText ]  ]
		ifFalse: [ PRPillarConfiguration new ].
	^ configuration 