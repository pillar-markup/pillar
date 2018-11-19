Class {
	#name : #PRPDFDocument,
	#superclass : #PRAbstractOutputDocument,
	#category : 'Pillar-ExporterLaTeX'
}

{ #category : #writing }
PRPDFDocument >> basicWriter [
	
	^ target writerFor: project configuration
]

{ #category : #compiling }
PRPDFDocument >> executeCommand: command arguments: arguments workingDirectory: aWorkingDirectory [

	OSPlatform current isWindows ifTrue: [ 
		^ self
			executeOnWindowsCommand: command
			arguments: arguments
			workingDirectory: aWorkingDirectory
	].
	^ self
		executeOnUnixCommand: command
		arguments: arguments
		workingDirectory: aWorkingDirectory
]

{ #category : #compiling }
PRPDFDocument >> executeOnUnixCommand: command arguments: arguments workingDirectory: aWorkingDirectory [
	| process |
	process := OSSUnixSubprocess new
		command: command;
		workingDirectory: aWorkingDirectory;
		arguments: arguments;
		runAndWait.
	process isSuccess ifFalse: [
		self error: 'command ', command ,' failed' ]
]

{ #category : #accessing }
PRPDFDocument >> extension [
	
	^ 'pdf'
]

{ #category : #writing }
PRPDFDocument >> postWriteTransform: aFile [
	
	"latexmk -pdflatex=lualatex -pdf -ps- -use-make \
		-latexoption=""--file-line-error --halt-on-error"" \
		-deps-out=""$*.d"" \
		file"	
	| relativePath outputFileReference |
	relativePath := file file relativeTo: project baseDirectory asAbsolute.
	outputFileReference := outputDirectory resolve: relativePath parent.
	self
		executeCommand: 'latexmk'
		arguments: { 
			'-pdflatex=lualatex' .
			'-pdf' .
			'-ps-' .
			'-interaction=nonstopmode' .
			'-outdir=', outputFileReference fullName.
			aFile fullName }
		workingDirectory: outputDirectory fullName
]

{ #category : #accessing }
PRPDFDocument >> transformations [

	^ super transformations, { 
		PRRelativeReferenceTransformer new
			inputFile: self inputFile;
			baseDirectory: project baseDirectory asAbsolute;
			outputDirectory: self outputDirectory;
			yourself.
		PRLatexPathUpdateVisitor new }
]

{ #category : #writing }
PRPDFDocument >> writeDocument: aDocument [

	| content environment templatedOutput outputFile |
	
	environment := self getMustacheTemplateValuesFromDocument: aDocument.
	content := self writer write: aDocument.
	environment at: #content put: content.

	"so that we can force to have book.bib in the environment"
	"we will have to fix that"
	"environment at: #bibFile put: (environment bibFile)."
	templatedOutput := (MustacheTemplate on: (self templateFile: aDocument) readStream contents) value: environment.


	self flag: #DuplicatedInSuperclass.
	outputFile := (self outputDirectory resolve: (file file relativeTo: project baseDirectory asAbsolute)) withoutExtension , 'tex'.
	outputFile ensureDelete.
	outputFile parent ensureCreateDirectory.
	outputFile writeStreamDo: [ :stream | 
		stream nextPutAll: templatedOutput ].
	^ outputFile
]
