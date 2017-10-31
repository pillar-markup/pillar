visiting-document
visitColumn: aColumn
	canvas tag
		name: 'div';
		parameterAt: 'class' put: 'column';
		parameterAt: 'style' put: 'float:left; margin:0; width:' , aColumn width greaseString , '%;';
		with: [ super visitColumn: aColumn ].
	canvas newLine