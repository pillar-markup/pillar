accessing
configuration
	
	| readConfiguration extension |
	extension := Dictionary new.
	extension at: 'baseDirectory' put: self baseDirectory.
	extension at: 'outputDirectory' put: self defaultOutputDirectoryName.
	
	"Just for backwrds compatibility"
	extension at: '_project' put: self.
	
	readConfiguration := self configurationFileReference exists
		ifFalse: [ PRPillarConfiguration newFromDictionary: extension ]
		ifTrue: [ PRPillarConfiguration newFromFile: self configurationFileReference extendedWith: extension ].
	^ readConfiguration