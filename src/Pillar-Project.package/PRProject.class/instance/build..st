building
build: output
	"Output is an instance of subclass of PRTarget"
	self prepareForTarget: output.
	toc := self generateToc.
	output buildOn: self