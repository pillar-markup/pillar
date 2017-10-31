visiting-document
visitStrikethroughFormat: aFormat

	canvas precede: [super visitStrikethroughFormat: aFormat] by: '[line-through]'