accessing
documentParser
	^ (self useCompiled and: [ Smalltalk globals hasClassNamed: 'PPCompiledParser' ])
		ifTrue: [ self compiledParser ]
		ifFalse: [ PRPillarParser new optimize ]