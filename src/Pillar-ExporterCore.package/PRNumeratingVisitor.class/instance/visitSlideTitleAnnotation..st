visiting-document
visitSlideTitleAnnotation: aSlideTitleAnnotation
	aSlideTitleAnnotation parameters
		at: 'label'
		ifPresent: [ :label | anchorsMapping at: label put: headerCounter current ]