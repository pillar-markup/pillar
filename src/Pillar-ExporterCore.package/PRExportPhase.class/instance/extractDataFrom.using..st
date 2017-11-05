private
extractDataFrom: aDocument using: aWriter
	| subConfiguration |
	subConfiguration := self configuration class new.
	subConfiguration parent: self configuration.
	CCMagritteDictionaryReader
		writeDictionary: aDocument properties copy
		toConfiguration: subConfiguration.
	self mergeConfiguration: subConfiguration.
	^ subConfiguration