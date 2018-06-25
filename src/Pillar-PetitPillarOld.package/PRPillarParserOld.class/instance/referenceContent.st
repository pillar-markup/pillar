from markdown
referenceContent
	^ super referenceContent ==> [ :array | PRText content: (self stringFrom: array) ]