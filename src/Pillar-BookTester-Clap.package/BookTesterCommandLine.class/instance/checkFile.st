running
checkFile
	
	self 
		checkFile: (arguments atName: 'path') value
		on: (VTermOutputDriver on: arguments context stdout)