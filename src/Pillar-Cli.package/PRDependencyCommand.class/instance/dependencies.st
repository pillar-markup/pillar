api
dependencies
	| cache inputFile |
	cache := Set new.
	inputFile := baseDirectory resolve: self inputFile.
	cache addAll: (self dependencyVisitor start: (PRDocument parser parse: inputFile contents)).
	^ cache