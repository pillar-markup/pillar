visiting-document
visitText: aText

	aText text: ((self class capitalizationConfiguration at: headerCapitalization ifAbsent: [ [ :text | text ] ]) value: aText text).
	headerCapitalization := 'raw'