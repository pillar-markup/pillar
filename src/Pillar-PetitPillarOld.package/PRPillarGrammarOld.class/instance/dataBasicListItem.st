grammar - List
dataBasicListItem
	^ (dataMarkup trimBlanks, listMarkup not , oneLineContent optional , lineEnd)
		==> [ :array | array third ifNil: [ {} ] ]