protected
validateParameters: aPRParameters dictionary: parametersDictionary in: anAnnotation
	| usedKeys |
	usedKeys := parametersDictionary keys.
	usedKeys isEmpty
		and: [ self hasParameters
				ifTrue: [ PRValidation strategy missingAnnotationParametersIn: anAnnotation ] ].
	(usedKeys
		allSatisfy: [ :each | self possibleParameters includes: each asSymbol ])
		ifFalse: [ PRValidation strategy
				invalidParameterNames: (usedKeys difference: self possibleParameters)
				forAnnotation: anAnnotation
				withParameters: aPRParameters ].
	self hasParameters not
		and: [ usedKeys isNotEmpty
				ifTrue: [ PRValidation strategy unexpectedParameterIn: anAnnotation ] ]