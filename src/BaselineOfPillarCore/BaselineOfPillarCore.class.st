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
				package: 'Pillar-Core';
				package: 'Pillar-Model' with: [ spec 
					requires: #( 'Pillar-Core' ) ];
				package: 'Pillar-Tests-Core' with: [ spec 
					requires: #( 'Pillar-Core' ) ];
				package: 'Pillar-Tests-Model' with: [ spec 
					requires: #( 'Pillar-Tests-Core' 'Pillar-Model') ].
		spec
			group: 'default' with: #('model' 'tests')	;
			group: 'core' with: #('Pillar-Core');
			group: 'model' with: #('Pillar-Model');
			group: 'tests' with: #('Pillar-Tests-Core' 'Pillar-Tests-Model')					
	]

]
