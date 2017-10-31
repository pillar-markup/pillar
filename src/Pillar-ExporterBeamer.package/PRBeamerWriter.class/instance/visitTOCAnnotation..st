visiting-annotations
visitTOCAnnotation: aTOCAnnotation
	canvas newLine.
	canvas environment
		name: 'frame';
		with: [ 
					canvas newLine.
					self createFrametitle: (aTOCAnnotation parameters at: 'title' ifAbsent: [ 'Table Of Content' ]).
					canvas newLine.
					self createTOCWith: aTOCAnnotation parameters.
					canvas newLine ].
	canvas newLine