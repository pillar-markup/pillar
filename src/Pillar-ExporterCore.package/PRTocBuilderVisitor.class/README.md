I am a visitor in charge of extracting table of contents from the files by visiting headers and inputAnnotations.

How to !?

PRTocBuilderVisitor new 
	documentSource: (FileSystem workingDirectory / 'file.pillar'); 
	currentFile: 'file.pillar';  
	inProcessFiles: (Array with: (FileSystem workingDirectory  / 'file.pillar' )); 
	visit: (PRPillarParser parse: (FileSystem workingDirectory / 'file.pillar') asFileReference readStream)