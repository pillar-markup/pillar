visiting
fileNamed: aStringDotPillar
	"Parser and set the bib file."
	
	self readStreamDo: [:str | (workingDirectory resolve: aStringDotPillar)]
		
