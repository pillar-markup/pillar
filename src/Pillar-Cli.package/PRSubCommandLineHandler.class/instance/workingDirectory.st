accessing
workingDirectory

	^ self
		optionAt: 'baseDirectory'
		ifPresent: [ :dir | ^ dir asFileReference ]
		ifAbsent: [ self error: 'Should specify #baseDirectory option through command line' ]