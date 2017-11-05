grammar - Header
header
	"I create a PRHeader"

	^ super header ==> [ :array | 
		(PRHeader 
			withAll: (array second ifNil: [ {} ]) 
			level: array first size)
			start: array first start;
			stop: array first start + array first size + (array second ifNil: [ 0 ] ifNotNil: [ array second size ]) ]