grammar - Format
formatFor: aMarkupParser
	^ 	epsilonToken ,
		aMarkupParser , 
		(aMarkupParser not , ( otherContent / formatContent)) star , 
		aMarkupParser,
		epsilonToken