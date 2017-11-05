accessing
configuration

	^ configuration ifNil: [ self configuration: self buildConfiguration ]