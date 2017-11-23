visiting-document
visitInputFileAnnotation: anInputFileAnnotation
	"I load the file and if the file exist I replace the node of the annotation by the content of the file."
	| includedFile includedPillarAST cleanPillarAST |
	includedFile := topFile parent resolve: anInputFileAnnotation value.
	self validateInclusionOfFile: includedFile.
	
	includedPillarAST := PRDocument parser parse: includedFile.
	
	cleanPillarAST := (PRCleanAnnotationInParagraphTransfomer new
		configuration: self configuration;
		start: includedPillarAST).
	
	"Execute a file inclusion step recursively" 
	includedPillarAST := PRFileInclusion new
		topFile: includedFile;
		inProcessFiles: (inProcessFiles copyWith: topFile);
		start: cleanPillarAST.
	
	"If we include a file, we need to update all references to external files in it.
	References that were before relative to the included document, should be now relative to the container document."
	PRUpdateFileInclusionReference
		start: includedPillarAST
		with: (includedFile parent relativeTo: topFile parent) pillarPrintString.
	
	self replace: includedPillarAST children.