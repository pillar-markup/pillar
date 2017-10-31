grammar - Text
text
	"Everything that is a pure text and nothing else (not a format, not a link, ...)"
	^  (escapedCharacter / ((newline , elementsAtLineBeginning) / otherContent / lineEnd) negate) plus