grammar - Table
tableCell
	| cellSeparator |
	cellSeparator := (Markups at: PRTableCell) asPParser.
	^ tableMarkups , (escapedCharacter / (cellSeparator / lineEnd) negate) star flatten