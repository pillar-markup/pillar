adding
addHeader: aDictionary ofLevel: aNumber to: aConfiguration
	| headerConfig |
	headerConfig := (aConfiguration class headerConfigurations at: (aDictionary at: 'renderAs' ifAbsent: [ 'roman' ]))
		with: aDictionary.
	headerConfig
		level: aNumber;
		configuration: aConfiguration.
	aConfiguration perform: ('level' , aNumber asString , ':') asSymbol with: headerConfig