tests
createPillarFile3
	| pillarFile |
	pillarFile := 'input3.pillar' asFileReference.
	
	pillarFile writeStreamDo: [ :stream |
		stream nextPutAll: '!! TestFile31

Look at my eyes'
		 ]