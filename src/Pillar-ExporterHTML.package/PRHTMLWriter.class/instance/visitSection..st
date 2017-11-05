visiting-document
visitSection: aSection
	canvas tag
		name: 'section';
		with: [ 
					canvas newLine.
					super visitSection: aSection ]