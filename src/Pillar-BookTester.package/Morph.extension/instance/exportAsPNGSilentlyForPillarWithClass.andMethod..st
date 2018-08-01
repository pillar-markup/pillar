*Pillar-BookTester
exportAsPNGSilentlyForPillarWithClass: aClassName andMethod: aMethodName
	
	"The png can be found under the file name YourBook/YourChapter/figures/screenshots/'YourChapter-SystemWindowName'.png"
	"The name of the png file itself is CurrentChapter-Class>>Method-TimeAndDate"
	| fileName time filePath |
	time := (((DateAndTime now asString copyReplaceAll: ':' with: '-') copyReplaceAll: '.' with: '-') splitOn: '+') first.
	fileName := (aClassName asString, '>>',aMethodName asString),'-', time.
	filePath := (FileSystem workingDirectory / 'figures' / 'screenshots').
	(filePath isFile)
		ifFalse: [ filePath ensureCreateDirectory ].
	PNGReadWriter putForm: self imageForm onFileNamed: 
		filePath / (fileName ,'.png').
	^ fileName
	
	