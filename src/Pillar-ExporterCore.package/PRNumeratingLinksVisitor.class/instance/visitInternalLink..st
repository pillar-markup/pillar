visiting-document
visitInternalLink: anInternalLink
	anInternalLink hasAnchor
		ifTrue: [ anInternalLink counter: (self anchorCounter: anInternalLink anchor) ]