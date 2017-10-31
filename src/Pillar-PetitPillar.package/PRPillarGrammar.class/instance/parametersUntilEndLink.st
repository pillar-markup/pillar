grammar - Parameter
parametersUntilEndLink
	^ parameterUntilEndLink
		, ((parameterMarkup , parameterUntilEndLink) ==> [ :array | array second ]) star