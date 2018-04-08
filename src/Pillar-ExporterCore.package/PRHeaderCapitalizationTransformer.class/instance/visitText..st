visiting-document
visitText: aText

	aText text: ((self capitalizationConfiguration at: headerCapitalization ifAbsent: [[:text|text]]) value: aText text).
	headerCapitalization := 'raw'