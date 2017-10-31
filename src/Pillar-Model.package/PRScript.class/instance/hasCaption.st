testing
hasCaption
	^ self parameters at: 'caption' ifPresent: [ :param | param isEmptyOrNil not ] ifAbsent: [ false ]