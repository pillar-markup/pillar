initialization
visitInputFileAnnotation: anAnnotation
	| document sourceSave currentSave newSource |
	"Resolve and parse the new file"
	sourceSave := self documentSource.
	currentSave := self currentFile.
	newSource := self documentSource parent resolve: anAnnotation value.
	self validateInclusionOfFile: newSource.
	document := PRPillarParser parse: newSource readStream.
	self documentSource: newSource.
	self currentFile: anAnnotation value.

	"Update inProcessFiles with the actual document"
	self
		inProcessFiles: (inProcessFiles copyWith: self documentSource);
		visit: document.
		
	"Get the original values"
	self currentFile: currentSave.
	self documentSource: sourceSave