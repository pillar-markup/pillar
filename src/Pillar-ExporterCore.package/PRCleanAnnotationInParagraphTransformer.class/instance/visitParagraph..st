visiting-document
visitParagraph: aParagraph
	(self paragraphOnlyContainsAnnotation: aParagraph)
		ifTrue: [ self replace: {aParagraph children first} ]