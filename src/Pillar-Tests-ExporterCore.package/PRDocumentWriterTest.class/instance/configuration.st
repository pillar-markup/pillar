helpers
configuration
	^ configuration ifNil: [ configuration := self configurationClass new ]