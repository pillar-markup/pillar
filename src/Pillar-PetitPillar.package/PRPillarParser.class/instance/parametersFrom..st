grammar - Paragraph
parametersFrom: array
	| result |
	result := OrderedDictionary new.
	
	array first first
		ifNotEmpty:
			[ :string | 
			result at: string trimBoth put: (self parametersConvertToPharoObject: array first second).
			array second
				do:
					[ :each | each first ifNotEmpty: [ result at: each first trimBoth put: (self parametersConvertToPharoObject: each second) ] ] ].
	^ result