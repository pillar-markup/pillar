initialization
fillFromAnother: another
	"copy all the field from another instance this is used to convert a configuration specification to an instance of one of the subclasses."
	"the equivalent of a changeClassToThatOf:"
	
	self autoAnchor: another autoAnchor. 
	self capitalization: another capitalization. 
	self level: another level. 
	self numbering: another numbering. 
	self renderAs: another renderAs. 
	self size: another size