testing
paragraphOnlyContainsAnnotation: aParagraph
	^ ((aParagraph children size between: 1 and: 2) and: [ aParagraph children first isKindOf: PRAbstractAnnotation ])
		and: [ self paragraphIsSingleton: aParagraph ]