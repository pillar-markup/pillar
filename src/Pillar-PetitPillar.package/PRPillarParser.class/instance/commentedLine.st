grammar - Text
commentedLine
	^ super commentedLine ==> [ :array | 
		(PRCommentedLine content: array third)
			start: array first start;
			stop: array last stop ]