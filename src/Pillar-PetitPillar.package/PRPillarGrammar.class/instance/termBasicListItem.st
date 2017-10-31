grammar - List
termBasicListItem
	^ (termMarkup trimBlanks, listMarkup not , oneLineContent optional , lineEnd)
		==> [ :array | array third ifNil: [ {} ] ]