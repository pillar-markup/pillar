visiting-document
visitInternalLink: anInternalLink
	| href |
	href := String new.
	self configuration separateOutputFiles
		ifTrue: [ anInternalLink hasReference
				ifTrue: [ href := href , anInternalLink referenceAsHTML ] ]
		ifFalse: [ self internalLinkWillBeRender: anInternalLink ].
	anInternalLink hasAnchor
		ifTrue: [ href := self addAnchorFrom: anInternalLink To: href ].
	self writeInternalLink: anInternalLink withRef: href.