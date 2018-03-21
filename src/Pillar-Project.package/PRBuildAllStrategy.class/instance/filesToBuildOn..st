accessing
filesToBuildOn: aProject
	
	| children |
	children := aProject baseDirectory children reject: [ :maybeExcludedDirectory |
		self shouldExcludeDirectory: maybeExcludedDirectory ].

	^ children flatCollect: [ :each |
		each allChildren select: [ :file |
			file isFile and: [ file extension = 'pillar' ] ] ]