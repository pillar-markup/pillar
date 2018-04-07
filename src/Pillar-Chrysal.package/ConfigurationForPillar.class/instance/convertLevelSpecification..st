conversion
convertLevelSpecification: aValue
	"generated code"
	| composite |
	composite := PRTitlePrinterSpecification new.
	aValue do: [:v | 
		    "We ignore undeclared fields"
			(#(#level #renderAs #capitalization #numbering #headerSize) includes: v key asSymbol)
				ifTrue: [ 
					| value |
					"if the element has been described we convert"
					(self declaredItems includes: v key asSymbol)
						ifTrue: [ value := self perform: (#convert, v key capitalized, ':') asSymbol with: v value ]
						ifFalse: [ value := v value ].		
					composite 
								perform:  (v key, ':') asSymbol 
								with: value].
		].
	^ composite