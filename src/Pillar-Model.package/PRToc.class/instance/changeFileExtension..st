converting
changeFileExtension: aPillarFile
	^ ((aPillarFile splitOn: '.') at: 1) , '.html'