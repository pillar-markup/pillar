visiting-document
visitPreformatted: aPreformatted
	
	canvas writeIndentedCodeBlockDuring: [
		aPreformatted children
			do: [ :child | self visit: child ]
			separatedBy: [canvas newLine ] ]
