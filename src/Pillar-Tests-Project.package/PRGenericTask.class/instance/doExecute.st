execution
doExecute
	
	[ ^ result := block value ]
		ensure: [ 
			isDone := true.
			modificationTime := DateAndTime now ]