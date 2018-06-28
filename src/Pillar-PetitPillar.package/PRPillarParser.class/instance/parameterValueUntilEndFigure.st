grammar - Parameter
parameterValueUntilEndFigure
	^ super parameterValueUntilEndFigure ==> [ :array | self stringFrom: array third ]