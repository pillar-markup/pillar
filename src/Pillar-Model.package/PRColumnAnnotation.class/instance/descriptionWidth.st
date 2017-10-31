descriptions
descriptionWidth
	<magritteDescription>
	^ MANumberDescription new
		accessor: #width;
		priority: 100;
		label: 'Width of the column';
		required: true;
		min: 0 max: 100;
		yourself