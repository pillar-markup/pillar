*Pillar-Pharo-Tools
gtInspectorAsciiDocRepresentationIn: composite
	<gtInspectorPresentationOrder: 80>
	composite text 
		title: 'AsciiDoc';
		display: [ 
			(PRAsciiDocWriter write: self) ]
