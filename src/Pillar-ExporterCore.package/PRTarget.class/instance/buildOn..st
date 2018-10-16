building
buildOn: aProject
	"Set the pipeline and execute it for each file of the project."
	
	"Set the pipeline"
	aProject contributeToPipelineBuilding: self.

	"For each file, we execute the pipeline"
	(self filesToBuildOn: aProject) do: [ :each |
		(self documentFor: each) buildOn: aProject ]