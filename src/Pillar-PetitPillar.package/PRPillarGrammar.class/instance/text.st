grammar - Text
text
	"Everything that is a pure text and nothing else (not a format, not a link, ...)"
	^  epsilonToken, 
		(escapedCharacter / ((newline , elementsAtLineBeginning) / otherContent / lineEnd) negate) plus, 
		epsilonToken