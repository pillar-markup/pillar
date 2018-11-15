visiting
visitExternalLink: aPRExternalLink

	| templateFile |
	templateFile := outputDocument templateDirectory / 'externalLink.mustache'.
	templateFile exists
		ifTrue: [ self halt ]
		ifFalse: [ defaultWriter visitExternalLink: aPRExternalLink ].