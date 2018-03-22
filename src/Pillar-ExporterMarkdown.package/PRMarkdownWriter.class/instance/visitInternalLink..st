visiting-document
visitInternalLink: anInternalLink
	| href |
	href := String new.
	anInternalLink hasReference ifTrue: [ href := href , anInternalLink referenceAsHTML ].
	anInternalLink hasAnchor ifTrue: [ href := href , '#' , anInternalLink anchor ].
	self writeInternalLink: anInternalLink withRef: href.