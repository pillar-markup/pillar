*Pillar-Pharo-Tools
gtInspectorBeamerRepresentationIn: composite
	<gtInspectorPresentationOrder: 80>
	composite text 
		title: 'Beamer';
		display: [ 
			(PRBeamerWriter write: self) ]
