accessing
plugins
	
	^ self configuration propertyAt: #plugins ifAbsent: [ #() ]