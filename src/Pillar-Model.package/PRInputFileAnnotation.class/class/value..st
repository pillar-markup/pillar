protected
value: aValue

	^ self withParameters: (SmallDictionary new
			at: 'value' put: aValue;
			yourself)