grammar - Reference
referenceFigure
	self flag: #todo. "We should maybe check for a :// inside the reference and maybe an extension."
	^ super referenceFigure ==> [ :array | self stringFrom: array ]