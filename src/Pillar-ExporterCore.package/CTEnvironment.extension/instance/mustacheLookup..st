*Pillar-ExporterCore
mustacheLookup: aString
	(aString = '.') ifTrue: [ ^ self ].
	^ self propertyAt: aString asSymbol
		ifPresent: [ :elem | elem ]
		ifAbsent: [  self mustacheLookupComplex: aString ]