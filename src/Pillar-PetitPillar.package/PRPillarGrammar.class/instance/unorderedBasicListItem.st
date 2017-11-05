grammar - List
unorderedBasicListItem
	^ (unorderedMarkup trimBlanks, listMarkup not , oneLineContent optional , lineEnd)
		==> [ :array | array third ifNil: [ {} ] ]