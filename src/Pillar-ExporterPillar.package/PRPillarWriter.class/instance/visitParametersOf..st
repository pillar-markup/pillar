visiting-document
visitParametersOf: objectWithParams
	| needSeparator |
	self flag: 'TODO: fix this ugly code. Caption here are treated separately because they contain Pillar text in a string (and this string should not be protected)'.
	needSeparator := false.
	objectWithParams parameters associations
		do:
			[ :assoc | 
			assoc key = 'caption'
				ifFalse:
					[ needSeparator := true.
					canvas nextPutAll: assoc key.
					assoc value
						ifNotNil:
							[ :value | 
							canvas
								raw: PRPillarParser defaultMarkupParameterValue;
								nextPutAll: value asString ] ] ]
		separatedBy: [ canvas raw: PRPillarParser defaultMarkupParameter ].
	objectWithParams parameters at: 'caption'
		ifPresent:
			[ :caption | needSeparator
				ifTrue: [ canvas raw: PRPillarParser defaultMarkupParameter ].
			canvas
				nextPutAll: 'caption';
				raw: PRPillarParser defaultMarkupParameterValue.
				stream << [ self visitAll: objectWithParams caption children ] ]