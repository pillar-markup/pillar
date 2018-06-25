grammar - Document
elementWithNewline
	^ (header / annotatedParagraph / anchor / commentedLine / horizontalRule , lineEnd) ==> #first