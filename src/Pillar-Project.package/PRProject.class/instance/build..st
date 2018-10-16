building
build: output
	"Output is an instance of subclass of PRTarget"
	
	"set up information required prior to pipeline building"
	self prepareForTarget: output.
	
	"Build the pipeline and execute it on each file of the project"
	output buildOn: self