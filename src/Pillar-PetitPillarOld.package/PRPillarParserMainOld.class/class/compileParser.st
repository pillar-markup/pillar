compiled parser
compileParser
	PRPillarParserOld new compileWithOptions: {#parserName: . self compiledParserName asSymbol}.
	^ Smalltalk classNamed: self compiledParserName
	