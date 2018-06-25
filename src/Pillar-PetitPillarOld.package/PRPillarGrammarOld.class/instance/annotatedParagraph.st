grammar - Paragraph
annotatedParagraph
	^ (Markups at: PRAnnotatedParagraph) asParser , ($  asParser / newline) negate star flatten , ($  asParser , oneLineContent) optional