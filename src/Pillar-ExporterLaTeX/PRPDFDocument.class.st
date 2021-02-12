Class {
	#name : #PRPDFDocument,
	#superclass : #PRAbstractOutputDocument,
	#category : #'Pillar-ExporterLaTeX'
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

{ #category : #compiling }
PRPDFDocument >> executeOnWindowsCommand: command arguments: arguments workingDirectory: aWorkingDirectory [
	| process success commandString |
	commandString := 'cd "', aWorkingDirectory, '" && ', command, ' ', (' ' join: arguments).
	
	process := ProcessWrapper new.
	process useStderr; useStdout.
	success := process startWithShellCommand: commandString.
	success ifFalse: [
		self error: 'command ', commandString ,' failed' ].

	success := process waitForExit.
	success ifFalse: [
		self error: 'command ', commandString ,' failed' ].
	
	Transcript show: process stdoutStream upToEnd.
	Transcript show: process stderrStream upToEnd.

	process closeStdin.
	process closeStderr.

	process exitCode = 0 ifFalse: [
		self error: 'command ', commandString ,' failed' ].
]

{ #category : #accessing }
PRPDFDocument >> extension [
	
	^ 'pdf'
]

{ #category : #writing }
PRPDFDocument >> postWriteTransform: aFile [

	| relativePath outputFileReference |
	relativePath := file file asAbsolute relativeTo: project baseDirectory asAbsolute.
	outputFileReference := outputDirectory resolve: relativePath parent.
	self
		executeCommand: 'latexmk'
		arguments: {
			'-lualatex=lualatex' . 
			'--file-line-error' .
			'--halt-on-error' . '%O' . '%S' .
			'-pdflua' .
			'-ps-' .
			'-silent' .
			'-outdir=', (self toCommandPath: outputFileReference fullName).
			self toCommandPath: (PRLaTeXWriter toLatexPath: (aFile relativeTo: outputDirectory) pillarPrintString) }
		workingDirectory: outputDirectory fullName
]

{ #category : #compiling }
PRPDFDocument >> toCommandPath: aPathString [

	OSPlatform current isWindows ifTrue: [ 
		^ aPathString surroundedBy: '"'
	].
	^ aPathString
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
	outputFile := (self outputDirectory resolve: (file file asAbsolute relativeTo: project baseDirectory asAbsolute)) withoutExtension , 'tex'.
	outputFile ensureDelete.
	outputFile parent ensureCreateDirectory.
	outputFile writeStreamDo: [ :stream | 
		stream nextPutAll: templatedOutput ].
	^ outputFile
]
