building
prepareForTarget: target

	target prepareForExecutionOn: self.
	self plugins do: [ :each | each prepareForExecutionOn: self ]