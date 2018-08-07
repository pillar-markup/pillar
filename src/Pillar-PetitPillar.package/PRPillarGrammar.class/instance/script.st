grammar - Script
script
	| endParser |
	endParser := newline asPParser , (EndMarkups at: PRCodeblock) asPParser , space star , lineEnd.
	^	epsilonToken, 
		(Markups at: PRCodeblock) asPParser , 
		scriptParameters , 
		endParser negate plus flatten , 
		endParser,
		epsilonToken