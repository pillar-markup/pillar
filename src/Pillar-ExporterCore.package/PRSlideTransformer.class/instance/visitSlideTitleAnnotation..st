visiting-annotations
visitSlideTitleAnnotation: anAnnotation
	currentSlide := (PRSlide
		titled: (anAnnotation parameters at: 'title' ifAbsent: [ 'New Slide' ]))
		label: (anAnnotation parameters at: 'label' ifAbsent: [ nil ]).
	self replace: { currentSlide }