*Pillar-BookTester
exportForPillarAs: anExtension using: aWriter withClass: aClassName andMethod: aMethodName
	
	"The png can be found under the file name YourBook/YourChapter/figures/'YourChapter-SystemWindowName'.png"
	"The name of the png file itself is CurrentChapter-SystemWindowName (often refers to Class>>Method)"
	| fileName |
	fileName := ((FileSystem workingDirectory) basename,'-', aClassName asString, '>>',aMethodName asString).
	aWriter putForm: self imageForm onFileNamed: 
		FileSystem workingDirectory / 'figures' / (fileName ,'.', anExtension).
	^ fileName
	
	