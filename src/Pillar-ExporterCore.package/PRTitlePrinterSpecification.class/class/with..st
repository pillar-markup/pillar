instance creation
with: aDictionary
	"what a ugly API"
	| inst |
	inst := super new
		numbering: (aDictionary at: 'numbering' ifAbsent: [ true ]);
		autoAnchor: (aDictionary at: 'autoAnchor' ifAbsent: [ false ]);
		capitalization: (aDictionary at: 'capitalization' ifAbsent: [ 'raw' ]);
		yourself.
	inst numbering
		ifTrue: [ inst size: (aDictionary at: 'size' ifAbsent: [ 0 ]) ]
		ifFalse: [ inst size: 0 ].
	^ inst