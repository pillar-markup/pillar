visiting
visitDocListAnnotation: aPRDocListAnnotation

	self replace: { (self createDocList: aPRDocListAnnotation) }
	"(workingDirectory / 'directoryFiles.pillar') ensureCreateFile"