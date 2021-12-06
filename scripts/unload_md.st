IceRepository registry 
	detect: [ :each | each name = 'Microdown' ]
	ifFound: [ :aRepository | aRepository forget ].

IceRepository registry 
	detect: [ :each | each name = 'pillar' ]
	ifFound: [ :aRepository | aRepository forget ].

"This, however, needs to stay :)"
#( 
	'BaselineOfMicrodown'
	'Microdown'
	'Microdown-Calypso'
	'Microdown-Pillar'
	'Microdown-Pillar-Tests'
	'Microdown-RichTextComposer'
	'Microdown-Tests'
	
	'BaselineOfPillar'
	'Pillar-Core'
	'Pillar-ExporterRichText'
	 ) do: [ :each | 
	(RPackageOrganizer default packageNamed: each ifAbsent: [ nil ]) 
		ifNotNil: [ :aPackage | aPackage removeFromSystem ] ]