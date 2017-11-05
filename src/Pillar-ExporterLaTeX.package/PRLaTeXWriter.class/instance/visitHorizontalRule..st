visiting-document
visitHorizontalRule: anHorizontalRule

	canvas newLine; newLine.
	canvas raw: '\rule{\textwidth}{0.1pt}'.
	canvas newLine.