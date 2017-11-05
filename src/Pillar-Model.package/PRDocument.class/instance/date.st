common-properties
date
	^ (self propertyAt: 'date' ifAbsent: [ self defaultDate ]) asDate