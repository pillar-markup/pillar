actions
installIn: baseDirectory

	(self directory / 'sample')
		children do: [ :child | child copyAllTo: baseDirectory / child basename ].
		
	self installTemplateIn: baseDirectory.