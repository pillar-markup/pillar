Class {
	#name : #BaselineOfPillarDocumentModel,
	#superclass : #BaselineOf,
	#category : #BaselineOfPillarDocumentModel
}

{ #category : #baselines }
BaselineOfPillarDocumentModel >> baseline: spec [

	<baseline>
	spec for: #common do: [ spec package: 'Pillar-Core' ]
]
