Class {
	#name : #BaselineOfPillarCore,
	#superclass : #BaselineOf,
	#category : #BaselineOfPillarCore
}

{ #category : #baselines }
BaselineOfPillarCore >> baseline: spec [
	<baseline>

	spec
		for: #common
		do: [ spec blessing: #baseline.
			spec 
				baseline: 'ContainersPropertyEnvironment' with: [ spec 
					repository: 'github://feenkcom/Containers-PropertyEnvironment' ];
				baseline: 'PetitParser2Core' with: [ spec
					 repository: 'github://kursjan/petitparser2' ];

				package: 'Pillar-Model';
				package: 'Pillar-PetitPillar' with: [ spec 
					requires: #( 'PetitParser2Core' 'Pillar-Model' ) ];
				"package: 'Pillar-Tests-Model' with: [ spec 
					requires: #('Pillar-Model' 'Pillar-ExporterPilar' 'Pillar-ExporterText') ];"
				package: 'Pillar-Tests-PetitPillar' with: [ spec 
					requires: #( 'Pillar-PetitPillar' )  ]
					
	]

]
