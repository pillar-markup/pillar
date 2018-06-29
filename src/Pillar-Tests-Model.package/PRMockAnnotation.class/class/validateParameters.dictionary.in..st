instance creation
validateParameters: aPRParameters dictionary: parametersDictionary in: anAnnotation
	super
		validateParameters: aPRParameters
		dictionary: parametersDictionary
		in: anAnnotation.
	parametersDictionary
		at: 'number'
		ifPresent: [ :v | parametersDictionary at: 'number' put: v asNumber ]