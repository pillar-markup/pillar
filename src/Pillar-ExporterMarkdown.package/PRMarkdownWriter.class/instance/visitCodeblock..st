visiting-document
visitCodeblock: aCodeBlock

	"Markdown by default does not support labels nor captions in scripts"
	aCodeBlock hasLabel ifTrue: [ 
		Warning signal: 'Unsupported feature: Markdown writer does not support code block labels' ].
	aCodeBlock hasCaption ifTrue: [ 
		Warning signal: 'Unsupported feature: Markdown writer does not support code block captions' ].
	self writeScript: aCodeBlock.