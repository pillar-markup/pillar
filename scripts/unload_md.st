IceRepository registry 
	detect: [ :each | each name = 'Microdown' ]
	ifFound: [ :aRepository | aRepository forget ].
"This, however, needs to stay :)"
#( 'BaselineOfMicrodownDev' 'BaselineOfMicrodown' 'Microdown' 'Microdown-Tests' 'Microdown-ResolvePath' 'Microdown-ResolvePath-Tests' ) do: [ :each | 
	(RPackageOrganizer default packageNamed: each ifAbsent: [ nil ]) 
		ifNotNil: [ :aPackage | aPackage removeFromSystem ] ]
