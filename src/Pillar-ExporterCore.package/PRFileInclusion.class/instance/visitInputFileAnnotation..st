visiting-document
visitInputFileAnnotation: anInputFileAnnotation
	"I load the file and if the file exist I replace the node of the annotation by the content of the file."
	| input includedFile phase includedPillarAST |
	input := self configuration propertyAt: #input.
	includedFile := anInputFileAnnotation fileWithConfiguration: self configuration.
	phase := PRParsingPhase withParser: input parser.
	includedPillarAST := phase parseFile: includedFile.
	"If we include a file, we need to update all references to external files in it.
	References that were before relative to the included document, should be now relative to the container document."
	PRUpdateFileInclusionReference
		start: includedPillarAST
		with: (includedFile parent relativeTo: self configuration baseDirectory) pillarPrintString.
	self replace: includedPillarAST children.