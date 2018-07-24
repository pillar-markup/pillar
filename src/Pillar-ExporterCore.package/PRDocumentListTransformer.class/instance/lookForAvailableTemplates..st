as yet unclassified
lookForAvailableTemplates: aCollection
	^ aCollection select: [ :each | (self workingDirectory resolve: each) exists and: [ each asFileReference extension = 'mustache' ] ] 