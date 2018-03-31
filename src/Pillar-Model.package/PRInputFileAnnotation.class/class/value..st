protected
value: aValue

	^ self withParameters: (OrderedDictionary new
			at: 'value' put: aValue;
			yourself)