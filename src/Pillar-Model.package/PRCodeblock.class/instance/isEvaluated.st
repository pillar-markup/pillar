testing
isEvaluated
	^ self parameters at: 'eval' ifAbsent: [ false ]