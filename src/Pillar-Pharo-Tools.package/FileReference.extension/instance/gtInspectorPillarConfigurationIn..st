*Pillar-Pharo-Tools
gtInspectorPillarConfigurationIn: composite
	<gtInspectorPresentationOrder: 40>
	| pillarConfiguration |
	(self basename = 'pillar.conf')
		ifFalse: [ ^ self ].
	pillarConfiguration := (PRPillarConfiguration newFromFile: self) baseDirectory: self parent.
	(pillarConfiguration
			gtInspectorInputFilesIn: composite)
			title: 'Pillar'