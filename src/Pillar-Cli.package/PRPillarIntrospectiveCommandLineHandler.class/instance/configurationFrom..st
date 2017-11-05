activation
configurationFrom: confFilename

	| builder |
	builder := PRAbstractBuilder new.
	builder createConfiguration: confFilename baseDirectory: self baseDirectory argDictionary: Dictionary new.
	^ builder configuration