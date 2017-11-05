visiting-document
visitHeader: aHeader
	self configuration renderStructureAsSlide
		ifTrue: [ 
			canvas tag
				name: 'div';
				parameterAt: 'class' put: 'slide';
				with: [ 
							canvas newLine.
							super visitHeader: aHeader ].
			canvas newLine ]