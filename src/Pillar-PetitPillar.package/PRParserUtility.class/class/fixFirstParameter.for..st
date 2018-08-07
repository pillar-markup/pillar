parameters
fixFirstParameter: aPRParameters for: aPRAnnotation 
	"The first parameter can be defined without parameter name.
	In such situation, it is necessary to set properly parameter key and value."
	| aParameter aValue |
	aPRParameters size isZero ifTrue: [ ^ self ].
	aParameter := aPRParameters children first.
	((aPRAnnotation possibleParameters includes: aParameter key) or: [ 
		aParameter value = PRParserUtility defaultParameterValue not ]) 
			ifTrue: [ ^ self ].
	aValue := self convertToPharoObject: aParameter keyNode name.
	aParameter valueNode value: aValue.
	aParameter valueNode start: aParameter keyNode start.
	aParameter valueNode stop: aParameter keyNode stop.
	aParameter keyNode name: aPRAnnotation defaultParameterName.
	aParameter keyNode stop: aParameter keyNode start.