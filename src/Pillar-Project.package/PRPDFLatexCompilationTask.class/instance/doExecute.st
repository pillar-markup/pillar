execution
doExecute
	
	"latexmk -pdflatex=lualatex -pdf -ps- -use-make \
		-latexoption=""--file-line-error --halt-on-error"" \
		-deps-out=""$*.d"" \
		file"
	
	
	| outputDirectory process inputFile |
	
	inputFile := savedDocument execute.
	outputDirectory := (goal project outputDirectory / goal target outputDirectoryName).
	
	process := OSSUnixSubprocess new
		command: 'latexmk';
		workingDirectory: outputDirectory fullName;
		arguments: { 
			'-pdflatex=lualatex' .
			'-pdf' .
			'-ps-' .
			'-interaction=nonstopmode' .
			'-outdir=', inputFile parent fullName.
			inputFile fullName };
		runAndWait.
	process isSuccess ifFalse: [
		self error: 'command latexmk failed' ]