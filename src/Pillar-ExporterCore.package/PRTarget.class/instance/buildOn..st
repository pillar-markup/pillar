building
buildOn: aProject
	"Set the pipeline and execute it for each file of the project."
	| status |
	status := PRSuccess new.
	
	"Set the pipeline"
	aProject contributeToPipelineBuilding: self.
	
	"For each file, we execute the pipeline"
	(self filesToBuildOn: aProject) do: [ :each |
		status := status and: ((self documentFor: each) buildOn: aProject) ].

	^ status