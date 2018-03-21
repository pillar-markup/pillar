descriptions transcripted to chrysal
descriptionRenderStructureAsSlide
	<magritteDescription>
	^ MABooleanDescription new
		accessor: #renderStructureAsSlide;
		priority: 100;
		label: 'Render the Structure as Slide for Sliders.';
		cocoonDocumentation:
				'When ==true== (the default), Pillar will create a dedicated slide for each Pillar header. This parameter is meaningless when generating a written document.';
		default: true;
		yourself