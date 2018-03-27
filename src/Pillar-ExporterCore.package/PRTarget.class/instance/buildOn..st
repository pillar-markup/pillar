building
buildOn: aProject

	aProject contributeToPipelineBuilding: self.

	(self filesToBuildOn: aProject) do: [ :each |
		(self documentFor: each) buildOn: aProject ]