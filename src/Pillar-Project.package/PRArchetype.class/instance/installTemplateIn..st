actions
installTemplateIn: baseDirectory 

	| destination |
	destination := baseDirectory / '_support'.
	destination ensureDeleteAll.

	"Because we move the support folder into a folder called _support"
	(self directory / 'support')
		copyAllTo: destination