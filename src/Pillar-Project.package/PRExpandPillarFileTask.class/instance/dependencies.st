accessing
dependencies
	
	| documentTree imageDependenciesVisitor imageDependencies fileDependenciesVisitor fileDependencies |
	documentTree := pillarDocument execute.
	
	imageDependenciesVisitor := PRImageDependencies new.
	imageDependencies := imageDependenciesVisitor start: documentTree.
	fileDependenciesVisitor := PRFileDependencies new.
	fileDependencies := (fileDependenciesVisitor start: documentTree)
		collect: [ :each | self pillarDependencyOn: each ].
		
	^ pillarDocument dependencies,
		imageDependencies,
			fileDependencies,
				(fileDependencies flatCollect: [ :each | each dependencies ])