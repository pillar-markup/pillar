grammar - Paragraph
parametersFrom: array
	| result |
	result := SmallDictionary new.
	array first first
		ifNotEmpty:
			[ :string | 
			result at: string put: array first second.
			array second
				do:
					[ :each | each first ifNotEmpty: [ result at: each first put: each second ] ] ].
	^ result