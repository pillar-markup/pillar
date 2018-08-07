grammar - Format
formatForArray: array
	^ array first withAll: (array second collect: [ :each | each second ])