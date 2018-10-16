building
prepareForTarget: target
	"We want to build a given project i.e. PDF, HTML. We are setting up the system to be built. With prepareForTarget:, the actions that will be triggered are happening before the pipeline is set and executed."
	
	target prepareForExecutionOn: self.
	self plugins do: [ :each | each prepareForExecutionOn: self ]