visiting-document
visitCodeblock: aCodeBlock
	aCodeBlock hasLabel
		ifTrue: [ self createAnchorWith: aCodeBlock label ].
	self writeScript: aCodeBlock.
	aCodeBlock hasCaption
		ifTrue: [ canvas
				raw: '**' , aCodeBlock caption text , '**';
				newLine ]