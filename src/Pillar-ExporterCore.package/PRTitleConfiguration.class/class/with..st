instance creation
with: aDictionary
	| config |
	config := super new
		numbering: (aDictionary at: 'numbering' ifAbsent: [ true ]);
		autoAnchor: (aDictionary at: 'autoAnchor' ifAbsent: [ false ]);
		capitalization: (aDictionary at: 'capitalization' ifAbsent: [ 'raw' ]);
		yourself.
	config numbering
		ifTrue: [ config size: (aDictionary at: 'size' ifAbsent: [ 0 ]) ]
		ifFalse: [ config size: 0 ].
	^ config