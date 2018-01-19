testing
isHideable
	^ self parameters at: 'hideable' ifPresent: [ :hideable | hideable = 'true' or: [ hideable = true ] ] ifAbsent: [ false ]