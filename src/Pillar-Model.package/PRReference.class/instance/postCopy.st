copying
postCopy
	super postCopy.
	self parameters: (self parameters
		collect: [ :each | each copy ])