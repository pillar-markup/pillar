from markdown
formatContent
	^ super formatContent ==> [ :array | PRText content: (self stringFrom: array) ]