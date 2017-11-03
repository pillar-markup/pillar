I'm an object managing configuration. I'm usually invoked from a command line but not only.

My main entry point is 

	createConfiguration: confFilename baseDirectory: baseDirectory argDictionary: arguments

When you type on the command line
	
	./pharo-ui Pillar.image pillar export --to="latex" Chapters/Chapter1/chapter1.pillar
	
You can obtain the same doing; 

	PRExportBuilder new 	
		createConfiguration: 'pillar.conf' 
		baseDirectory:  FileSystem workingDirectory   
		argDictionary: {
				'inputFile'-> (FileSystem workingDirectory / 'Chapters/Chapter1/chapter1.pillar') .
				'defaultExporters' -> {'latex'}
				} asDictionary;
		export
		