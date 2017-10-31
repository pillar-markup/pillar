*Pillar-Pharo-Tools
gtInspectorSBALaTeXRepresentationIn: composite
	<gtInspectorPresentationOrder: 80>
	composite text 
		title: 'LaTeX (sbabook)';
		display: [ 
			(PRSBALaTeXWriter write: self) ]
