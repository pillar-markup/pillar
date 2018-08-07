grammar - Header
header
	"I create a PRHeader"

	^ super header ==> [ :array | 
		(PRHeader 
			withAll: (array third ifNil: [ {} ]) 
			level: array second size)
			start: array first start;
			stop: array last stop ]