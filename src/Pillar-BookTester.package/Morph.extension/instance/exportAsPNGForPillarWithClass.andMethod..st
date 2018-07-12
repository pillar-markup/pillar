*Pillar-BookTester
exportAsPNGForPillarWithClass: aClassName andMethod: aMethodName
	
	| fileName |
	fileName := self exportForPillarAs: 'png' using: PNGReadWriter withClass: aClassName andMethod: aMethodName.
	^ fileName
	