visiting
visitCodeblock: aCodeBlock

	(aCodeBlock hasParameter: 'testable')
		ifTrue: [ Transcript show: aCodeBlock text; cr .
					Transcript show: (Compiler evaluate: aCodeBlock text) isOk; cr ]
		