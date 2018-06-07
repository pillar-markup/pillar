visiting
visitCodeblock: aCodeBlock

	self halt.
	(aCodeBlock hasParameter: 'testable')
		ifTrue: [ Transcript show: aCodeBlock text; cr .
					Transcript show: (Compiler evaluate: aCodeBlock text) isOk; cr ]
		