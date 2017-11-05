visiting-document
visitColumns: aColumns
	canvas tag
		name: 'div';
		parameterAt: 'class' put: 'columns';
		parameterAt: 'style' put: 'margin:0px auto; width:100%';
		with: [ super visitColumns: aColumns ].
	canvas newLine