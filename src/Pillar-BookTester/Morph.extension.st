Extension { #name : #Morph }

{ #category : #'*Pillar-BookTester' }
Morph >> exportAsPNGSilentlyForPillarFileNamed: aFileName [
	
	"The png can be found under the file name YourBook/YourChapter/figures/screenshots/'YourChapter-SystemWindowName'.png"
	"The name of the png file itself is Class>>Method-TimeAndDate"
	| filePath |
	filePath := (FileSystem workingDirectory / 'figures' / 'screenshots').
	(filePath isFile)
		ifFalse: [ filePath ensureCreateDirectory ].
	PNGReadWriter putForm: self imageForm onFileNamed: 
		filePath / aFileName.
	
	
]
