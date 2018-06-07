*Pillar-Pharo-Tools
gtInspectorTreeRepresentationIn: composite
	<gtInspectorPresentationOrder: 30>
	composite tree
		title: 'Tree';
		children: [ :item | 
					item hasChildren
						ifTrue: [ item children ] ];
		format: [ :item | (item class name allButFirst: 2) , '(' , item asString , ')' ]