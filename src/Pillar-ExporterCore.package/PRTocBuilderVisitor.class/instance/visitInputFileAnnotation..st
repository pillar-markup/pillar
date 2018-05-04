initialization
visitInputFileAnnotation: anAnnotation
	| document fileSave currentSave |
	"Resolve and parse the new file"
	document := PRPillarParser parse: (self documentSource parent resolve: anAnnotation value) readStream.
	fileSave := self documentSource.
	currentSave := self currentFile.
	self documentSource: (self documentSource parent resolve: anAnnotation value).
	self currentFile: anAnnotation value.
	self visit: document.
	self currentFile: currentSave.
	self documentSource: fileSave