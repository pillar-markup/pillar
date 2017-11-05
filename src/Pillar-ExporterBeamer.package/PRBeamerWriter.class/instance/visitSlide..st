visiting-document
visitSlide: aSlide
	canvas newLine.
	canvas environment
		name: 'frame';
		optParameter: 'fragile';
		with: [ 
					canvas newLine.
					aSlide hasLabel
						ifTrue: [ 
							canvas command
								name: 'label';
								parameter: aSlide label.
							canvas newLine ].
					self createFrametitle: aSlide title.
					canvas newLine.
					super visitSlide: aSlide ].
	canvas newLine