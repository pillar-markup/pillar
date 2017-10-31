visiting-document
visitInternalLink: anInternalLink
	anInternalLink hasReference
		ifTrue: [ self cachedDependencies add: (anInternalLink localFileOrExternalReference) ].
	super visitInternalLink: anInternalLink 