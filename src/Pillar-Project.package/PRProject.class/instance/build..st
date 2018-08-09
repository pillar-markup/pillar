building
build: output
	"Output is an instance of subclass of PRTarget"
	self prepareForTarget: output.
	self status: (output buildOn: self)