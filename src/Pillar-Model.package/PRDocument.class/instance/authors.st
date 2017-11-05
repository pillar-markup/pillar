common-properties
authors
	^ self propertyAt: 'authors' ifAbsent: [ self defaultAuthors ]