tests
testStrictLineBreaksInAnnotatedParagraphs
	| item lineBreak |
	item := self
		addText: 'Blah'
		to:
			(PRAnnotatedParagraph new
				annotation: 'note';
				yourself).
	lineBreak := self configuration newLine.
	self assertWriting: item includesText: '\begin{note}' , lineBreak , 'Blah' , lineBreak , '\end{note}' , lineBreak