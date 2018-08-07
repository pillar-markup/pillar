from markdown
formatContent
	^ super formatContent ==> [ :array | 
		(PRText content: (self stringFrom: array second))
			start: array first start;
			stop: array third stop ]