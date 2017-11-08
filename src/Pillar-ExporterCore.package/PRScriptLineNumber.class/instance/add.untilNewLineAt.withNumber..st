adding
add: aString untilNewLineAt: firstOccurence withNumber: number

	| length |
	length := firstOccurence + self configuration newLine size -1.
	self add: (aString first: length) withNumber: number.
	^ aString allButFirst: length