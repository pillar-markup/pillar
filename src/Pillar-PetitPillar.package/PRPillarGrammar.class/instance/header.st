grammar - Header
header
	"A header begin by a certain amount of $! and contains a text and/or some formatedText"

	^ 	epsilonToken ,
		(Markups at: PRHeader) asPParser plus , 
		oneLineContent optional trimBlanks , 
		epsilonToken