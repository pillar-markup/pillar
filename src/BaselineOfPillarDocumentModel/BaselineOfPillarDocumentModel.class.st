Class {
	#name : #BaselineOfPillarDocumentModel,
	#superclass : #BaselineOf,
	#category : #BaselineOfPillarDocumentModel
}

{ #category : #baselines }
BaselineOfPillarDocumentModel >> baseline: spec [
	<baseline>

	spec
		for: #common
		do: [ spec blessing: #baseline.
			spec 
				package: 'Pillar-Core';
				package: 'Pillar-Tests-Core' with: [ spec 
					requires: #( 'Pillar-Core' ) ];
				package: 'Pillar-ExporterRichText' 
					with: [ spec requires: #('Pillar-Core') ].
		]
]
