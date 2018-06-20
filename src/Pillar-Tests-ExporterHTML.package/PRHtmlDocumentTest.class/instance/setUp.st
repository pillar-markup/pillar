initialization
setUp
	self createPillarFile1.
	self createMustacheTemplateFile.
	self createPillarConfFile.
	project := PRProject new baseDirectory: FileSystem workingDirectory.
	"htmlDocument := PRHtmlDocument new.
	projectDirectory := '../test' asFileReference.
	projectDirectory ensureDeleteAll.
	projectDirectory ensureCreateDirectory.
	project := PRProject on: projectDirectory."
	