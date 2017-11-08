tests
testSupportFilesWithFolderInsideOutputDirectoryAreNotExported
	"I check that, when womeone creatd a new subconfiguration, the defaults configurations still exists."

	| ston folder config |
	folder := FileSystem memory root.
	(folder / 'bar') ensureCreateDirectory.
	(folder / 'bar' / 'foo.html') ensureCreateFile.
	ston := '{
		"support": [ "bar/foo.html" ],
		"outputDirectory": "bar"
}'.
	config :=  self configurationClass  new
		baseDirectory: folder;
		yourself.
	CCMagritteDictionaryReader
		writeDictionary: (STON fromString: ston)
		toConfiguration: config.
	config
		inputString: 'Test';
		outputStream: String new writeStream;
		disabledPhases: { #templating };
		export: #text.
	self assert: (folder / 'bar' / 'bar' / 'foo.html') exists not