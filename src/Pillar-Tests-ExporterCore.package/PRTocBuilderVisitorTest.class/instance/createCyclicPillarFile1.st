tests
createCyclicPillarFile1
	| pillarFile |
	pillarFile := 'cyclic1.pillar' asFileReference.
	
	pillarFile writeStreamDo: [ :stream |
		stream nextPutAll: '!! TestCyclicFile1

${inputFile:path=cyclic1.pillar}$

Look at my eyes'
		 ]