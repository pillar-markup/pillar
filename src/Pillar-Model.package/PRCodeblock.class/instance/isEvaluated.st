testing
isEvaluated
	^ self parameters at: 'eval' ifPresent: [ :eva | eva = 'true' or: [ eva = true ] ] ifAbsent: [ false ]