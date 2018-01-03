actions
installTemplateIn: baseDirectory 

	| destination |
	self halt.
	destination := baseDirectory / '_support'.
	destination ensureDeleteAll.

	(self directory / 'support')
		copyAllTo: destination