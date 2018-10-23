*Pillar-ExporterCore
mustacheLookup: aString
	(aString = '.') ifTrue: [ ^ self ].
	^ self propertyAt: aString asSymbol
		ifPresent: [ :elem | elem asMustachableValue ]
		ifAbsent: [ self mustacheLookupComplex: aString ]