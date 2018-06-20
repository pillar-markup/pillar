initialization
visitInputFileAnnotation: anAnnotation
	| document sourceSave currentSave newSource |
	"Resolve and parse the new file"
	sourceSave := self documentSource.
	currentSave := self currentFile.
	newSource := self documentSource parent resolve: anAnnotation path.
	self validateInclusionOfFile: newSource.
	document := PRPillarParser parse: newSource contents.
	self documentSource: newSource.
	self currentFile: anAnnotation path.

	"Update inProcessFiles with the actual document"
	self
		inProcessFiles: (inProcessFiles copyWith: self documentSource);
		visit: document.

	"Get the original values"
	self currentFile: currentSave.
	self documentSource: sourceSave