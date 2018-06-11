grammar - Paragraph
parametersFrom: array
	| result |
	result := OrderedDictionary new.
	
	array first first
		ifNotEmpty:
			[ :string | 
			result at: string trimBoth put: array first second.
			array second
				do:
					[ :each | each first ifNotEmpty: [ result at: each first put: each second ] ] ].
	^ result