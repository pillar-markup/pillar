accessing
configuration
	
	| readConfiguration extension |
	extension := Dictionary new.
	extension at: 'baseDirectory' put: self baseDirectory.
	extension at: 'outputDirectory' put: self defaultOutputDirectoryName.
	
	"Just for backwrds compatibility"
	extension at: '_project' put: self.
	
	readConfiguration := self configurationFileReference exists
		ifFalse: [ ConfigurationForPillar newFromDictionary: extension ]
		ifTrue: [ ConfigurationForPillar newFromFile: self configurationFileReference extendedWith: extension ].
	^ readConfiguration