accessing
dependencies
	
	| parsingPhase tree inclusionPhase expandedTree imageDependenciesVisitor taskConfiguration |
	tree := pillarDocument execute.

	"This should be another dependency"
	inclusionPhase := PRFileInclusion new.
	inclusionPhase configuration: taskConfiguration.
	expandedTree := inclusionPhase executeOn: tree.
	
	imageDependenciesVisitor := PRImageDependencies new.
	^ pillarDocument dependencies, (imageDependenciesVisitor start: expandedTree)