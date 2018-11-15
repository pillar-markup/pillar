visiting
start: aPRDocument
	| conf |
	conf := ConfigurationForPillar newFromDictionary: aPRDocument properties.
	conf parent: self configuration.
	self configuration: conf.
	super start: aPRDocument.
	^ aPRDocument