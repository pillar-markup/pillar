grammar - Format
formatFor: aMarkupParser
	^ aMarkupParser , (aMarkupParser not , ( otherContent / formatContent)) star , aMarkupParser