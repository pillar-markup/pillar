Class {
	#name : #BaselineOfPillarFormat,
	#superclass : #BaselineOf,
	#category : #BaselineOfPillarFormat
}

{ #category : #baselines }
BaselineOfPillarFormat >> baseline: spec [
	<baseline>

	spec
		for: #common
		do: [
			spec 
				package: 'Pillar-PetitPillar' with: [ 
					spec requires: #( 'PetitParser2Core' 'PillarCore' ) ];
				package: 'Pillar-Tests-PetitPillar' with: [ 
					spec requires: #( 'Pillar-PetitPillar' ) ].
		spec 
			group: 'default' with: #('pillar');
			group: 'pillar' with: #('pillar-parser' 'pillar-parser-tests');
			group: 'pillar-parser' with: #('Pillar-PetitPillar');
			group: 'pillar-parser-tests' with: #('Pillar-Tests-PetitPillar').
		
		self 
			pillarCore: spec;
			containerPropertyEnvironment: spec;
			petitParser2Core: spec ]

]

{ #category : #baselines }
BaselineOfPillarFormat >> containerPropertyEnvironment: spec [ 
	spec 
		baseline: 'ContainersPropertyEnvironment' with: [ 
			spec 
				repository: 'github://Ducasse/Containers-PropertyEnvironment' ]
]

{ #category : #baselines }
BaselineOfPillarFormat >> petitParser2Core: spec [ 
	spec 
		baseline: 'PetitParser2Core' with: [ 
			spec
				repository: 'github://kursjan/petitparser2' ]
]

{ #category : #baselines }
BaselineOfPillarFormat >> pillarCore: spec [ 
	spec 
		baseline: 'PillarCore' with: [ 
			spec
				repository: 'github://pillar-markup/pillar' ]
]
