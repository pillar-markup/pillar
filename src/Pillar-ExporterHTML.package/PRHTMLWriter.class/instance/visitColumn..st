visiting-document
visitColumn: aColumn
	canvas tag
		name: 'div';
		parameterAt: 'class' put: 'column';
		parameterAt: 'style' put: 'float:left; margin:0; width:' , aColumn width asString , '%;';
		with: [ super visitColumn: aColumn ].
	canvas newLine