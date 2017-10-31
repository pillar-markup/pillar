grammar - Parameter
parameterKeyUntilEndFigure
	^ super parameterKeyUntilEndFigure ==> [ :array | self stringFrom: array ]