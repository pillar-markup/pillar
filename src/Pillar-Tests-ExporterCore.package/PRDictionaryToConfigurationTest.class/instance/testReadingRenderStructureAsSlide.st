tests ok in chrysal too
testReadingRenderStructureAsSlide
	| dictionary config |
	dictionary := Dictionary with: 'renderStructureAsSlide' -> false.
	config := self configurationClass newFromDictionary: dictionary.
	self assert: config renderStructureAsSlide equals: false