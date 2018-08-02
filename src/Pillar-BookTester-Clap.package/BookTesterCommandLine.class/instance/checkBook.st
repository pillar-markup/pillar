running
checkBook
	
	self 
		checkBook: (arguments atName: 'path') value
		on: (VTermOutputDriver on: arguments context stdout)