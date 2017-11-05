visiting-document
visitSlide: aSlide
	canvas tag
		name: 'div';
		parameterAt: 'class' put: 'slide';
		with: [ 
					canvas newLine.
					aSlide hasLabel
						ifTrue: [ 
							self createAnchorWith: aSlide label.
							canvas newLine ].
					self createNewSlideTitle: aSlide title.
					super visitSlide: aSlide ].
	canvas newLine