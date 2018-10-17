building
buildOn: aProject

	| status |
	status := PRSuccess new.
	aProject contributeToPipelineBuilding: self.
	(self filesToBuildOn: aProject) do: [ :each |
		status := status and: ((self documentFor: each) buildOn: aProject) ].
	^ status