accessing
iconNamed: aSymbol
	"Returns the icon with the given name"
	
	^(self iconCache) 
		at: aSymbol 
		ifAbsentPut: [ 
			"this is a hack to make Nautilus work"
			(self class canUnderstand: aSymbol) 
				ifTrue: [ self perform: aSymbol ]
				ifFalse: [ super iconNamed: aSymbol ] ]