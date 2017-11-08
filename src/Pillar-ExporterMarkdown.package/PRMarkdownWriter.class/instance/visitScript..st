visiting-document
visitScript: aScript
	aScript hasLabel
		ifTrue: [ self createAnchorWith: aScript label ].
	self writeScript: aScript.
	aScript hasCaption
		ifTrue: [ canvas
				raw: '**' , aScript caption text , '**';
				newLine ]