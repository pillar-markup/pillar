tests - from cocoon
testReadingNewLine
	| dictionary config |
	dictionary := Dictionary with: 'newLine' -> #unix.
	config := self configurationClass newFromDictionary: dictionary.
	self assert: config newLine equals: UnixPlatform new lineEnding