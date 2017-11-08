execution
executeOn: aPRCompilationContext 
	
	"latexmk -pdflatex=lualatex -pdf -ps- -use-make \
		-latexoption=""--file-line-error --halt-on-error"" \
		-deps-out=""$*.d"" \
		file"
	
	
	| extension relativePath outputFileReference outputFormat outputDirectory |
	
	configuration := aPRCompilationContext configuration.
	outputFormat := configuration propertyAt: #_outputFormat.
	outputDirectory := configuration outputDirectory  / outputFormat outputDirectoryName.
	extension := outputFormat extension.
	relativePath := configuration input file path
		relativeTo: configuration baseDirectory path.
	outputFileReference := ((outputDirectory resolve: relativePath parent) / relativePath basename), extension.
	
	OSSUnixSubprocess new
		command: 'latexmk';
		workingDirectory: outputDirectory fullName;
		arguments: { 
			'-pdflatex=lualatex' .
			'-pdf' .
			'-ps-' .
			'-outdir=', outputFileReference parent fullName.
			outputFileReference fullName };
		runAndWait