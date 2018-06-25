grammar - Paragraph
annotatedParagraph
	^	epsilonToken , 
		(Markups at: PRAnnotatedParagraph) asPParser , 
		($  asPParser / newline) negate star flatten , 
		($  asPParser , oneLineContent) optional ,
		epsilonToken 