instance-creation
withContext: aContext
	"The API is done this way (without using the parameter) because most of the subclasses do not need to access the context of the process (such as files, configuration). Some subclasses may get access by redefine it."
	
	^ self new 
		