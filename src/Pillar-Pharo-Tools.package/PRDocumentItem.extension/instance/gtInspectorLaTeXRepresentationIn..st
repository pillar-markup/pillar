*Pillar-Pharo-Tools
gtInspectorLaTeXRepresentationIn: composite
	<gtInspectorPresentationOrder: 80>
	composite text 
		title: 'LaTeX';
		display: [ 
			(PRLaTeXWriter write: self) ]
