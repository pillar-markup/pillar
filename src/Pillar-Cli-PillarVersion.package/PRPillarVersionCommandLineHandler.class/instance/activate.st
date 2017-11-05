activation
activate
	self stdout
		nextPutAll: PRPillarVersion current asString;
		nextPutAll: OSPlatform current lineEnding.
	Smalltalk isInteractive 
		ifFalse: [ self exitSuccess ]