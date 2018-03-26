helpers
addHeader: aDictionary ofLevel: aNumber to: aPrinter
	| print |
	print := (aPrinter strategyClassMapping at: (aDictionary at: 'renderAs' ifAbsent: [ 'roman' ])) with: aDictionary.
	print level: aNumber.
	aPrinter perform: ('level' , aNumber asString , ':') asSymbol with: print