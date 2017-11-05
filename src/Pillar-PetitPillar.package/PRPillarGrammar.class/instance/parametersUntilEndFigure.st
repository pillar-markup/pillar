grammar - Parameter
parametersUntilEndFigure
	^ parameterUntilEndFigure
		, ((parameterMarkup , parameterUntilEndFigure) ==> [ :array | array second ]) star