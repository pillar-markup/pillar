visiting-document
visitUnderlineFormat: aFormat
	
	canvas precede: [super visitStrikethroughFormat: aFormat] by: '[underline]'

	