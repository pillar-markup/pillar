compiled parser
compiledParser
	^ (Smalltalk hasClassNamed: self compiledParserName)
		ifTrue: [ Smalltalk classNamed: self compiledParserName ]
		ifFalse: [ self compileParser ]