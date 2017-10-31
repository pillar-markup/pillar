descriptions
descriptionDepthLevel
	<magritteDescription>
	^ MANumberDescription new
		accessor: #depthLevel;
		priority: 100;
		label: 'Depth Level of the ToC';
		required: true;
		min: 0 max: 7;
		yourself