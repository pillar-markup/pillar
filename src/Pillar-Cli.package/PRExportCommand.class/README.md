This installer is invoked for example when we use the following command line

./pharo-ui Pillar.image pillar export --to="latex" Chapters/Chapter1/chapter1.pillar

Here is a typical example to use me. 


	PRExportBuilder new 	
		createConfiguration: 'pillar.conf' 
		baseDirectory:  FileSystem workingDirectory   
		argDictionary: {
				'inputFile'-> (FileSystem workingDirectory / 'Chapters/Chapter1/chapter1.pillar') .
				'defaultExporters' -> {'latex'}
				} asDictionary;
		export