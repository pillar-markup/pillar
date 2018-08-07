grammar - Format
formatForArray: array
	^ (array second withAll: (array third collect: [ :each | each second ]))
		start: array first start;
		stop: array last stop