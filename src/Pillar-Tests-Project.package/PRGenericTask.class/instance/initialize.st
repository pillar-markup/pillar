execution
initialize

	super initialize.
	isDone := false.
	dependencies := Set new.
	modificationTime := DateAndTime now.