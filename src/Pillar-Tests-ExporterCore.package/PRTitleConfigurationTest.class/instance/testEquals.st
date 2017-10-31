tests
testEquals
	| config |
	config := self configurationClass new.
	self addHeader: self defaultDictionary ofLevel: 1 to: config.
	self addHeader: self defaultDictionary ofLevel: 2 to: config.
	self assert: config level1 = config level1.
	self deny: config level2 = config level1