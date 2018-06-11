visiting
checkAndReportFileNamed: aPath
	"Parser and set the bib file."
	
	| text |
	text := (workingDirectory resolve: aPath) asFileReference readStreamDo: [:str | str contents].
	self start: (PRPillarParser new parse: text).
	^ self 
		
