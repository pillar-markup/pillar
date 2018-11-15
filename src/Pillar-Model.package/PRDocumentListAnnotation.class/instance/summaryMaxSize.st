visiting
summaryMaxSize

	^ self parameters at: #summaryMaxSize
		ifPresent: [ :size | size asInteger ]
		ifAbsent: [ 500 ]