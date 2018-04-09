*Pillar-Pharo-Tools
gtInspectorPillarProjectIn: composite
	<gtInspectorPresentationOrder: 20>
	| pillarFile pillarConfiguration |
	self isDirectory not ifTrue: [ ^ self ].
	pillarFile := self files 
						detect: [:each | each basename = 'pillar.conf']
						ifNone: [ ^ self ].
	pillarConfiguration := (ConfigurationForPillar newFromFile: pillarFile) baseDirectory: self.
	(pillarConfiguration
			gtInspectorInputFilesIn: composite)
			title: 'Pillar'