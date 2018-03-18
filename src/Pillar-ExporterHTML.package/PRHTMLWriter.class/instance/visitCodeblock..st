visiting-document
visitCodeblock: aCodeBlock
	canvas tag
		name: 'figure';
		with: [ 
					canvas tag
						name: 'pre';
						with: [ 
									| code language |
									code := canvas tag
										name: 'code';
										yourself.
									language := self languageForScript: aCodeBlock.
									language isSyntaxHighlightingPossible
										ifTrue: [ code parameterAt: 'class' put: language printString ].
									code with: [ canvas lines: aCodeBlock text ] ].
					canvas tag
						name: 'figcaption';
						with: [ 
									aCodeBlock hasLabel
										ifTrue: [ 
											self createAnchorWith: aCodeBlock label.
											self writeCounterForScript: aCodeBlock ].
									aCodeBlock hasCaption
										ifTrue: [ self visitAll: aCodeBlock caption children ] ] ].
	canvas newLine