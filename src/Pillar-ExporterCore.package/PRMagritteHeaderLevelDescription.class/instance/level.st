accessing
level
	^ self propertyAt: #level ifAbsent: [ self class defaultLevel ]