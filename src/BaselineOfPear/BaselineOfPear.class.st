"
Pay attention not working.
"
Class {
	#name : #BaselineOfPear,
	#superclass : #BaselineOf,
	#category : #BaselineOfPear
}

{ #category : #baselines }
BaselineOfPear >> baseline: spec [
	<baseline>
	
	spec for: #'common' do: [
		spec baseline: 'Pillar' with: [ spec 
				"loads: #('rich text exporter');"
				repository: 'github://pillar-markup/pillar:dev-8/src' ].
		spec baseline: 'Microdown' with: [ 
			spec repository: 'github://pillar-markup/Microdown/src' ].	
		
		spec
			baseline: 'FileDialog'
			with: [ spec repository: 'github://Ducasse/file-dialog/repository' ].	
					
		spec 
			package: 'Pillar-Pear' 	
			with: [ spec requires: #('Pillar-ExporterMicrodown' 'FileDialog') ].
		
		spec 
			package: 'Pillar-Microdown' 
			with: [ spec requires: #('Pillar' 'Microdown') ].
			
		spec 
			package: 'Pillar-ExporterMicrodown' 
			with: [ spec requires: #('Pillar' 'Microdown') ].
		]

]
