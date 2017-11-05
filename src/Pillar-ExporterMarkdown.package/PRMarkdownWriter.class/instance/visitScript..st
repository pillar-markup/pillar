visiting-document
visitScript: aScript
	aScript hasLabel
		ifTrue: [ self createAnchorWith: aScript label.
			canvas newLine ].
	self scriptLayout: aScript.
	aScript hasCaption
		ifTrue: [ canvas
				raw: '**' , aScript caption text , '**';
				newLine ]