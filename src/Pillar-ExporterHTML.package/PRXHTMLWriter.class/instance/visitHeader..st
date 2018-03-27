visiting-document
visitHeader: aHeader
	canvas tag
		name: 'div';
		parameterAt: 'id' put: aHeader text asValidSelector;
		with: [ super visitHeader: aHeader ].
	canvas newLine