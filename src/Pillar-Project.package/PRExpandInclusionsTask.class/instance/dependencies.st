accessing
dependencies
	
	| documentTree imageDependenciesVisitor imageDependencies fileDependenciesVisitor fileDependencies |
	documentTree := pillarDocumentDependency execute.
	
	imageDependenciesVisitor := PRImageDependencies new.
	imageDependencies := imageDependenciesVisitor start: documentTree.
	fileDependenciesVisitor := PRFileDependencies new.
	fileDependencies := (fileDependenciesVisitor start: documentTree)
		collect: [ :each | self pillarDependencyOn: each ].
		
	^ pillarDocumentDependency dependencies,
		(imageDependencies asArray collect: [ :each | PRGenericObjectTask result: each ]),
			(fileDependencies asArray collect: [ :each | PRGenericObjectTask result: each ]),
				(fileDependencies flatCollect: [ :each | each dependencies ])