visiting-document
visitInputFileAnnotation: anInputFileAnnotation
	"I load the file and if the file exist I replace the node of the annotation by the content of the file."

	| file |
	file := anInputFileAnnotation fileWithConfiguration: self configuration.
	file exists
		ifTrue: [ self includeFile: file ]
		ifFalse: [ anInputFileAnnotation errorFileNotFound: file ]