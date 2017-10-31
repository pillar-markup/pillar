action
actionOn: anInput
	"I take a collection of files, I parse them, I can transform them and I return a collection of PRDocument."
	self configuration: anInput configuration.
	^ self parseInput: anInput input