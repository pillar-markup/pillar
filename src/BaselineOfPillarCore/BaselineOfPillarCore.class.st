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
				baseline: 'ContainersPropertyEnvironment' with: [spec
					repository: 'github://Ducasse/Containers-PropertyEnvironment' ];
				baseline: 'PetitParser2Core' with: [ spec
					repository: 'github://kursjan/petitparser2' ];
				package: 'Pillar-Core';
				package: 'Pillar-Model' with: [ spec 
					requires: #( 'Pillar-Core' ) ];
				package: 'Pillar-Tests-Core' with: [ spec 
					requires: #( 'Pillar-Core' ) ];
				package: 'Pillar-Tests-Model' with: [ spec 
					requires: #( 'Pillar-Tests-Core' 'Pillar-Model') ];
				package: 'Pillar-PetitPillar' with: [ spec
					requires: #( 'PetitParser2Core' 'Pillar-Model' ) ];
				package: 'Pillar-Tests-PetitPillar' with: [ spec
					requires: #( 'Pillar-PetitPillar' ) ].					
		spec
			group: 'default' with: #('model' 'tests')	;
			group: 'core' with: #('Pillar-Core');
			group: 'model' with: #('Pillar-Model' 'Pillar-PetitPillar');
			group: 'tests' with: #('Pillar-Tests-Core' 'Pillar-Tests-Model' 'Pillar-Tests-PetitPillar')					
	]
]
