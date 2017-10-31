converting
outputFileName
	^ self outputFile isStream
		ifFalse: [ self outputFile basename withoutPeriodSuffix ]
		ifTrue: [ 'writeStream' ]