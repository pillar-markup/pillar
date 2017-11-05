visiting-document
visitReference: aReference
	aReference hasAlias
		ifTrue:
			[ 
			super visitReference: aReference.
			canvas raw: PRPillarParser defaultMarkupReferenceAlias ].
	canvas
		raw:
			(aReference reference isNil
				ifTrue: [ '' ]
				ifFalse: [ aReference reference ]).
	aReference hasAnchor
		ifTrue:
			[ 
			canvas raw: PRPillarParser defaultMarkupReferenceAnchor.
			canvas nextPutAll: aReference anchor ].
	aReference hasParameters
		ifTrue:
			[ 
			canvas raw: PRPillarParser defaultMarkupParameter.
			self visitParametersOf: aReference ]