visiting-document
visitCommentedLine: aCommentedLine
	canvas potentialNewLine.
	canvas raw: (self markupFor: aCommentedLine).
	canvas raw: aCommentedLine text.