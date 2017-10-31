descriptions
descriptionSlideInTemplateForDeckJS
	<magritteDescription>
	^ MANumberDescription new
		accessor: #slideInTemplateForDeckJS;
		priority: 100;
		label: 'Number of slides in Template';
		cocoonDocumentation: 'Indicate the number of slides created by the DeckJS template. This is important to create anchors.';
		default: 1;
		isInteger;
		min: -7 max: 7;
		yourself