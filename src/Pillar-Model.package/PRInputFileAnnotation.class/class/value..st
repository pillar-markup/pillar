protected
value: aValue

	^ self parameters: (SmallDictionary new
			at: 'value' put: aValue;
			yourself)