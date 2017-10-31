visiting-document
addAnchorFrom: anInternalLink To: href
	| anchor |
	anchor := anchorMapping
		at: anInternalLink anchor
		ifPresent: [ :num | (num - 1) asString	"We do -1 because the first slide have an anchor with 0 and not 1" ]
		ifAbsent: [ 
			PRReferenceNotFound signal: 'Can''t find anchor named ''' , anInternalLink anchor , ''''.
			'' ].
	^ href , '#slide-' , anchor