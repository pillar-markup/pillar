visiting-codeblock
checkAndReportFileNamed: aPath
	"The API we want to be using: 
	Visitor checkAndReportFileNamed: path"
	| text |
	text := (workingDirectory resolve: aPath) asFileReference readStreamDo: [:str | str contents].
	self start: (PRPillarParser new parse: text).
	self allTestResults do: [:each | self finalStatus: (self finalStatus and: each status) ]
		
