accessing
templateFile

	| configuration |
	configuration := goal project configuration.
	^ configuration baseDirectory / ((goal target writerFor: configuration) templateForConfiguration: configuration)