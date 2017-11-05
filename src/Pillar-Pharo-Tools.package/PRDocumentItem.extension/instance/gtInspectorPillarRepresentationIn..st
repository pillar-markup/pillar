*Pillar-Pharo-Tools
gtInspectorPillarRepresentationIn: composite
	<gtInspectorPresentationOrder: 40>
	composite text 
		title: 'Pillar';
		display: [ 
			(PRPillarWriter write: self) ]
