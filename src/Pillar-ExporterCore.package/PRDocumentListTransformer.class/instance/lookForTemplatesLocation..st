as yet unclassified
lookForTemplatesLocation: aCollection
	^ aCollection select: [ :each | (self workingDirectory resolve: each) exists ] 