initialization
visitInputFileAnnotation: anAnnotation
	| document fileSave |
	"Resolve and parse the new file"
	document := PRPillarParser parse: anAnnotation value asFileReference.
	fileSave := self documentSource.
	self documentSource: anAnnotation value.
	self visit: document.
	self documentSource: fileSave