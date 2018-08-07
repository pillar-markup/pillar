accessing
strategy
	^ PRValidation value ifNil: [ self defaultStrategy ]