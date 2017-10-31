extras
download: aString
	| path znClient |
	path := 'https://ci.inria.fr/pharo-contribution/job/Pillar-Archetypes/default/lastSuccessfulBuild/artifact/'	
	, aString , '.zip'.
	znClient := ZnClient new path: path.
	(znClient downloadTo: configuration baseDirectory)
		ifTrue: [ self unzip: aString ]