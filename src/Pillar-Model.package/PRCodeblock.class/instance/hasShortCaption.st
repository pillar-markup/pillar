testing
hasShortCaption
	^ self parameters at: 'shortCaption'
		ifPresent: [ :param | param isEmptyOrNil not ]
		ifAbsent: [ false ]