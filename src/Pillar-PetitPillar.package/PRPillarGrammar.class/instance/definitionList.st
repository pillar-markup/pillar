grammar - List
definitionList
	^ 	epsilonToken ,
		(termListItem / dataListItem) plus , 
		epsilonToken