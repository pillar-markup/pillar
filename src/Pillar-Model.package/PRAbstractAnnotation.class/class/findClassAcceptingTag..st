protected
findClassAcceptingTag: aTag
	^ self withAllConcreteClasses
		detect: [ :class | class acceptName: aTag ]
		ifNone: [ PRSyntaxError signal: 'Pillar doesn''t support this tag : ''' , aTag , ''' on his annotations.' ]