descriptions
descriptionLevel
	<magritteDescription>
	^ MANumberDescription new
		accessor: #level;
		priority: 100;
		label: 'Level of the ToC';
		required: true;
		min: 0 max: 7;
		yourself