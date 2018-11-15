*Pillar-ExporterCore
mustacheLookup: aString
	(aString = '.') ifTrue: [ ^ self ].
	^ self propertyAt: aString asSymbol
		ifPresent: [ :elem | elem asMustachableValue ]
		ifAbsent: [ (super mustacheLookup: aString) asMustachableValue ]