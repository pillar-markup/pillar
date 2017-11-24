tests
testExpandingFileIncludingItselfFails

	| task document fileSystem topFileReference |
	fileSystem := FileSystem memory.
	topFileReference := fileSystem root / 'topFile'.
	
	document := PRDocument new.
	document add: (PRInputFileAnnotation value: 'topFile').
	
	task := PRExpandInclusionsTask new.
	task inputFile: topFileReference.
	task pillarDocumentDependency: (PRGenericObjectTask result: document).
	
	self should: [ task execute ] raise: PRCyclicFileInclusionError