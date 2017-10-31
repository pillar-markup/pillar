grammar - Raw
rawType
	^ (rawEndMarkup / rawTypeMarkup) negate plus flatten , rawTypeMarkup ==> [ :array | array first ] 