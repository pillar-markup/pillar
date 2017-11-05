*Pillar-Pharo-Tools
gtInspectorMarkdownRepresentationIn: composite
	<gtInspectorPresentationOrder: 70>
	composite text 
		title: 'Markdown';
		display: [ 
			(PRMarkdownWriter write: self) ]
