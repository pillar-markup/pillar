running
setUp
	super setUp.
	baseDirectory := FileSystem memory root.
	self
		createFile: 'code.st'
		With: self aCode
		In: baseDirectory