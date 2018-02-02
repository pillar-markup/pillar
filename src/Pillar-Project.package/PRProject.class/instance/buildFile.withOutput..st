building
buildFile: inputDocument withOutput: buildTarget

	| goal |
	goal := PRBuildGoal new
		project: self;
		inputDocument: inputDocument;
		target: buildTarget.
	goal buildPipeline execute.