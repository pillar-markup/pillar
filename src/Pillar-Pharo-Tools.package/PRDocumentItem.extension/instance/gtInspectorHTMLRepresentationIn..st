*Pillar-Pharo-Tools
gtInspectorHTMLRepresentationIn: composite
	<gtInspectorPresentationOrder: 50>
	composite text 
		title: 'HTML';
		display: [ 
			(PRHTMLWriter write: self) ]
