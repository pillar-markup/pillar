"
I'm a baseline for Pillar with the microdown extension. 
Basically I load the full pillar baseline, the full microdown version and in addition the package Pillar-ExporterMicrodown and Tool. 

It was necessary to do it that because we have circular dependencies.
In the future we may move Microdown-Pillar to this project, this way microdown will not depend from pillar. 

 
"
Class {
	#name : #BaselineOfPillarMicro,
	#superclass : #BaselineOf,
	#category : #BaselineOfPillarMicro
}

{ #category : #baselines }
BaselineOfPillarMicro >> baseline: spec [
	<baseline>
	
	spec for: #'common' do: [
		spec baseline: 'Pillar' with: [ spec 
				"loads: #('rich text exporter');"
				repository: 'github://pillar-markup/pillar:dev-8/src' ].
		spec baseline: 'Microdown' with: [ 
			spec repository: 'github://pillar-markup/Microdown/src' ].	
		spec 
			package: 'Pillar-ExporterMicrodown' 
			with: [ spec requires: #('Pillar' 'Microdown') ].
		]

]
