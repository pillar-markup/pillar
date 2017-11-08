accessing
filesToBuild
	
	| children |
	children := project baseDirectory children reject: [ :maybeExcludedDirectory |
		maybeExcludedDirectory isDirectory and: [ self shouldExcludeDirectory: maybeExcludedDirectory ] ].

	^ children flatCollect: [ :each |
		each allChildren select: [ :file |
			file isFile and: [ file extension = 'pillar' ] ] ]