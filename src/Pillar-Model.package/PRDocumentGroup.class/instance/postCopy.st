copying
postCopy
	super postCopy.
	self setChildren: (self children
		collect: [ :each | each copy ])