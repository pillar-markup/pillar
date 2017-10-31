private
formatValue: aValue

	^ aValue isString
			ifTrue:[ '"', aValue, '"' ]
			ifFalse:[ aValue asString ]