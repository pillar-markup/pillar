visiting-document
visitInternalLink: anInternalLink
	| href |
	href := String new.
	self configuration separateOutputFiles
		ifTrue: [ 
			anInternalLink hasReference
				ifTrue: [ href := href , anInternalLink referenceAsHTML ] ]
		ifFalse: [ self internalLinkWillBeRender: anInternalLink ].
	anInternalLink hasAnchor
		ifTrue: [ href := self addAnchorFrom: anInternalLink To: href ].
	canvas tag
		name: 'a';
		parameterAt: 'href' put: href;
		with: [ 
					anInternalLink counter isValidCounter
						ifTrue: [ 
							self writeCounter: anInternalLink counter.
							anInternalLink hasAlias
								ifTrue: [ canvas nextPutAll: ' ' ] ].
					super visitInternalLink: anInternalLink ]