visiting
visitMonospaceFormat: aPRMonospaceFormat 
	
	| templateFile |
	templateFile := outputDocument templateDirectory / 'monospace.mustache'.
	templateFile exists
		ifTrue: [ self halt ]
		ifFalse: [ defaultWriter visitMonospaceFormat: aPRMonospaceFormat ].