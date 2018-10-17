visiting
caption

	^ self parameters at: #caption ifAbsent: [ self className, '>>', self methodName ]