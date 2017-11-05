*Pillar-Pharo-Tools
gtInspectorTextRepresentationIn: composite
	<gtInspectorPresentationOrder: 60>
	composite text 
		title: 'Text';
		display: [ 
			(PRTextWriter write: self) ]
