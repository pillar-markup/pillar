initialization
visitInputFileAnnotation: anAnnotation
	| document fileSave |
	"Resolve and parse the new file"
	document := PRPillarParser parse: (self documentSource parent resolve: anAnnotation value) readStream.
	fileSave := self documentSource.
	self documentSource: (self documentSource parent resolve: anAnnotation value).
	self visit: document.
	self documentSource: fileSave