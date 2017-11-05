accessing
documentParser
	^ (self useCompiled and: [ Smalltalk hasClassNamed: 'PPCompiledParser' ])
		ifTrue: [ self compiledParser ]
		ifFalse: [ PRPillarParser ]