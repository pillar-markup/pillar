actions
installTemplateIn: baseDirectory 

	| destination |
	destination := baseDirectory / '_support'.
	destination ensureDeleteAll.

	(self directory / 'support')
		copyAllTo: destination