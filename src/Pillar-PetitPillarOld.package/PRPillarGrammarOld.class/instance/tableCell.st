grammar - Table
tableCell
	| cellSeparator |
	cellSeparator := (Markups at: PRTableCell) asParser.
	^ tableMarkups , (escapedCharacter / (cellSeparator / lineEnd) negate) star flatten