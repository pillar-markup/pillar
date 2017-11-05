visiting-document
visitHeader: aHeader
	super visitHeader: aHeader.
	self configuration renderStructureAsSlide
		ifTrue: [ 
			canvas newLine.
			canvas environment
				name: 'frame';
				with: [ 
							canvas newLine.
							canvas environment
								name: 'center';
								with: [ 
											canvas newLine.
											canvas command
												name: 'huge';
												parameter: [ self visitDocumentGroup: aHeader ].
											canvas newLine ] ].
			canvas newLine ]