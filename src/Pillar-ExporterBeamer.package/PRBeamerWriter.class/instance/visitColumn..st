visiting-annotations
visitColumn: aColumn
	canvas environment
		name: 'column';
		parameter: [ 
					canvas
						nextPutAll: (aColumn width asNumber / 100.0) printString;
						raw: '\textwidth' ];
		with: [ super visitColumn: aColumn ].
	canvas newLine