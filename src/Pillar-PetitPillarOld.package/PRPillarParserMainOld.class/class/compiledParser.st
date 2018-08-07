compiled parser
compiledParser
	^ (self environment hasClassNamed: self compiledParserName)
		ifTrue: [ self environment classNamed: self compiledParserName ]
		ifFalse: [ self compileParser ]