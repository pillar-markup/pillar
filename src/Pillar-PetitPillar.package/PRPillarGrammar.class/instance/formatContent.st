from markdown
formatContent
	^ 	epsilonToken ,
		(escapedCharacter / specialFormatMarkups negate) plus ,
		epsilonToken