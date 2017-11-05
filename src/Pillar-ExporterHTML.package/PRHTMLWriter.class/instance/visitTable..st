visiting-document
visitTable: aTable
	canvas tag
		name: 'table';
		parameterAt: 'style' put: 'border: solid thin';
		with: [ super visitTable: aTable ].
	canvas newLine