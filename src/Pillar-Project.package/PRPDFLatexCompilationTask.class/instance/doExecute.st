execution
doExecute
	
	"latexmk -pdflatex=lualatex -pdf -ps- -use-make \
		-latexoption=""--file-line-error --halt-on-error"" \
		-deps-out=""$*.d"" \
		file"
	
	
	| outputDirectory process |
	
	outputDirectory := (goal project outputDirectory / goal target outputDirectoryName).
	
	process := OSSUnixSubprocess new
		command: 'latexmk';
		workingDirectory: outputDirectory fullName;
		arguments: { 
			'-pdflatex=lualatex' .
			'-pdf' .
			'-ps-' .
			'-interaction=nonstopmode' .
			'-outdir=', self inputFile parent fullName.
			self inputFile fullName };
		runAndWait.
	process isSuccess ifFalse: [
		self error: 'command latexmk failed' ].

	^ self outputFile