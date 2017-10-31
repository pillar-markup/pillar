Given information from the command line I manage dependency analysis.

I can be invoked as follow 
./pharo-ui Pillar.image fileDependencies  --configurationFile=pillar.conf Chapters/Chapter1/chapter1.pillar

but also from ur lovely system as

PRDependencyScripter new
	createConfiguration: 'pillar.conf' 
	baseDirectory:  FileSystem workingDirectory   
	argDictionary: {
			'inputFile'-> (FileSystem workingDirectory / 'Chapters/Chapter1/chapter1.pillar') } asDictionary;
	printDependencies