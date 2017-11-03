private
add: argument to: arguments
	"From the argument string '--key=value', add the key/value pair to the arguments dictionary."
	
	^ arguments add: (self parseKeyValueArgument: argument)