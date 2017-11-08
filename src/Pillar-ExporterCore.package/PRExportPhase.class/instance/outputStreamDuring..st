private
outputStreamDuring: aBlock
	| output |
	output := self configuration outputFile isStream
		ifTrue: [ self configuration outputFile ]
		ifFalse: [ self configuration outputDirectory resolve: self configuration outputFile ].
	output pillarWriteDuring: aBlock.
	self createSymbolicLink.
	^ output