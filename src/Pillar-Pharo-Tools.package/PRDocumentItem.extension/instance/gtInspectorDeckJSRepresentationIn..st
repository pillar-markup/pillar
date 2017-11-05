*Pillar-Pharo-Tools
gtInspectorDeckJSRepresentationIn: composite
	<gtInspectorPresentationOrder: 51>
	composite text 
		title: 'DeckJS';
		display: [ 
			(PRDeckJSWriter write: self) ]
