requirements
testExportCitation

	| item |
	item := PRDocument new
		add: (PRCitation ref: 'hello');
		yourself.
	self
		assertWriting: item
		includesText: self citationRepresentation.