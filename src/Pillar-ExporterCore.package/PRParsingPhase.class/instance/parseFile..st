parsing
parseFile: aFile
	| result subConfiguration |
	result := aFile
		readStreamDo: [ :input | 
			| znReadStream |
			znReadStream := (ZnCharacterReadStream on: (aFile readStreamDo: [ :stream | stream binary contents ]) readStream) contents asString readStream.
			[ self parser parse: znReadStream ]
				on: PRError , STONReaderError
				do:
					[ :exception | exception class signal: exception messageText , ' Inside: ' , aFile basename ] ].
	subConfiguration := self configuration class new.
	subConfiguration parent: self configuration.
	CCMagritteDictionaryReader
		writeDictionary: result properties copy
		toConfiguration: subConfiguration.
	self configuration: subConfiguration.
	^ result