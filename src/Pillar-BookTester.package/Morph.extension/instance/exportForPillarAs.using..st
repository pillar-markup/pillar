*Pillar-BookTester
exportForPillarAs: anExtension using: aWriter
	
	"The png can be found under the file name YourBook/YourChapter/figures/'YourChapter-SystemWindowName'.png"
	"The name of the png file itself is CurrentChapter-SystemWindowName (often refers to Class>>Method)"
	| fileName |
	fileName := (FileSystem workingDirectory parent) basename,'-', (self externalName splitOn: '(') first trimBoth.
	aWriter putForm: self imageForm onFileNamed: 
		FileSystem workingDirectory / 'figures' / fileName ,'.', anExtension.
	^ fileName
	
	