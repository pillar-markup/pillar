accessing
configuration: aConfiguration 
	configuration := aConfiguration.
	stream ifNotNil: [ stream configuration: aConfiguration ]