protected
findClassAcceptingTag: aTag ifNone: aBlock
	^ self withAllConcreteClasses
		detect: [ :class | class acceptName: aTag ]
		ifNone: aBlock