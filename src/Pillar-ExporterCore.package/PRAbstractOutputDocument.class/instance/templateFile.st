templating
templateFile
	
	^ project baseDirectory / (self writer templateForConfiguration: project configuration)