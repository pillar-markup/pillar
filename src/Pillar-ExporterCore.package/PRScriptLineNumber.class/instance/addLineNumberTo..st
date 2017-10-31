adding
addLineNumberTo: aScript
	"I add a numerotation at each line of a script."

	| text firstOccurence number |
	text := aScript text.
	number := 1.
	stream := String new writeStream.
	firstOccurence := text indexOfSubCollection: self configuration newLine.
	[ firstOccurence = 0 ]
		whileFalse: [ 
			text := self add: text untilNewLineAt: firstOccurence withNumber: number.
			firstOccurence := text indexOfSubCollection: self configuration newLine.
			number := number + 1 ].
	self add: text withNumber: number.
	^ aScript text: stream contents